import { spawn } from "node:child_process";
import { basename } from "node:path";
import type { AssistantMessage } from "@earendil-works/pi-ai";
import type { ExtensionAPI, ExtensionContext } from "@earendil-works/pi-coding-agent";
import { truncateToWidth, visibleWidth } from "@earendil-works/pi-tui";
import {
  calculateTensorXCost,
  contextTone,
  formatReset,
  layoutTier,
  meter,
  parseCodexRateLimits,
  type CodexLimit,
  type LayoutTier,
} from "./core.ts";

const ICONS = {
  cache: "󰆼",
  clock: "󰥔",
  context: "󰘚",
  folder: "󰉋",
  git: "",
  input: "󰍛",
  model: "󰊴",
  output: "󰍠",
  provider: "󰚩",
  thinking: "󰔛",
};

function readCodexLimit(): Promise<CodexLimit | null> {
  return new Promise((resolve) => {
    const child = spawn("codex", ["app-server", "--stdio"], {
      stdio: ["pipe", "pipe", "ignore"],
    });
    let buffer = "";
    let finished = false;

    const finish = (value: CodexLimit | null) => {
      if (finished) return;
      finished = true;
      clearTimeout(timeout);
      child.kill();
      resolve(value);
    };

    const timeout = setTimeout(() => finish(null), 5_000);
    child.once("error", () => finish(null));
    child.once("exit", () => finish(null));
    child.stdout.setEncoding("utf8");
    child.stdout.on("data", (chunk: string) => {
      buffer += chunk;
      const lines = buffer.split("\n");
      buffer = lines.pop() ?? "";
      for (const line of lines) {
        if (!line.trim()) continue;
        try {
          const message = JSON.parse(line) as { id?: number; result?: unknown };
          if (message.id === 1) {
            child.stdin.write(`${JSON.stringify({ method: "initialized", params: {} })}\n`);
            child.stdin.write(
              `${JSON.stringify({ method: "account/rateLimits/read", id: 2, params: {} })}\n`,
            );
          }
          if (message.id === 2) finish(parseCodexRateLimits(message.result));
        } catch {
          continue;
        }
      }
    });
    child.stdin.write(
      `${JSON.stringify({
        method: "initialize",
        id: 1,
        params: {
          clientInfo: { name: "pi-precision-footer", title: "Pi Precision Footer", version: "1.0.0" },
        },
      })}\n`,
    );
  });
}

function totals(ctx: ExtensionContext) {
  let input = 0;
  let output = 0;
  let cacheRead = 0;
  let tensorXCost = 0;
  let hasTensorXPrice = false;

  for (const entry of ctx.sessionManager.getBranch()) {
    if (entry.type !== "message" || entry.message.role !== "assistant") continue;
    const message = entry.message as AssistantMessage;
    input += message.usage.input;
    output += message.usage.output;
    cacheRead += message.usage.cacheRead;
    if (message.provider !== "tensorx") continue;
    const cost = calculateTensorXCost(message.model, {
      input: message.usage.input,
      output: message.usage.output,
      cacheRead: message.usage.cacheRead,
    });
    if (cost === null) continue;
    hasTensorXPrice = true;
    tensorXCost += cost;
  }

  return { input, output, cacheRead, tensorXCost, hasTensorXPrice };
}

function formatCount(value: number): string {
  if (value < 1_000) return `${value}`;
  if (value < 1_000_000) return `${(value / 1_000).toFixed(value < 10_000 ? 1 : 0)}k`;
  return `${(value / 1_000_000).toFixed(value < 10_000_000 ? 1 : 0)}M`;
}

function renderMeter(percent: number, color: (text: string) => string, cells = 10): string {
  const value = meter(percent, cells);
  return color("█".repeat(value.filled)) + "░".repeat(value.empty);
}

function projectPart(
  ctx: ExtensionContext,
  branch: string | null,
  tier: LayoutTier,
  accent: (text: string) => string,
  muted: (text: string) => string,
): string {
  const project = basename(ctx.cwd);
  const context = ctx.getContextUsage();
  const percent = context?.percent ?? 0;
  const tone = contextTone(percent);
  const contextColor = (text: string) => ctx.ui.theme.fg(tone, text);
  const contextMeter = renderMeter(percent, contextColor, tier === "minimal" ? 5 : 10);
  const usage = totals(ctx);
  const projectName = `${ICONS.folder} ${project}`;
  const branchName = branch ? ` ${accent(ICONS.git)} ${branch}` : "";
  const contextPart = `${ICONS.context} ${contextMeter} ${Math.round(percent)}%`;

  if (tier === "minimal") return contextPart;
  if (tier === "compact") return `${projectName}${branchName} ${muted("")} ${contextPart}`;
  return `${projectName}${branchName} ${muted("")} ${ICONS.input} ${formatCount(usage.input)} ${ICONS.output} ${formatCount(usage.output)} ${ICONS.cache} ${formatCount(usage.cacheRead)} ${muted("")} ${contextPart}`;
}

function providerPart(
  ctx: ExtensionContext,
  tier: LayoutTier,
  codexLimit: CodexLimit | null,
  accent: (text: string) => string,
  muted: (text: string) => string,
): string {
  const provider = ctx.model?.provider ?? "no-provider";
  const model = ctx.model?.id ?? "no-model";
  const thinkingLevel = ctx.thinkingLevel;
  const thinking = !thinkingLevel || thinkingLevel === "off" || tier === "minimal" ? "" : ` ${ICONS.thinking} ${thinkingLevel.toUpperCase()}`;
  const modelPart = `${ICONS.model} ${model}${thinking}`;

  if (provider === "openai-codex") {
    const remaining = codexLimit?.remainingPercent;
    const quota = remaining === undefined
      ? `${accent(`${ICONS.provider} CODEX`)} --`
      : `${accent(`${ICONS.provider} CODEX`)} ${renderMeter(remaining, accent, tier === "minimal" ? 5 : 10)} ${Math.round(remaining)}%`;
    const reset = codexLimit && tier === "full" ? ` ${ICONS.clock} ${formatReset(codexLimit.resetsAt)}` : "";
    return `${quota}${reset} ${muted("")} ${modelPart}`;
  }

  if (provider === "tensorx") {
    const usage = totals(ctx);
    const knownModel = calculateTensorXCost(model, { input: 0, output: 0, cacheRead: 0 }) !== null;
    const cost = usage.hasTensorXPrice || knownModel ? `$${usage.tensorXCost.toFixed(3)}` : "--";
    return `${accent(`${ICONS.provider} TENSORX`)} ${cost} ${muted("")} ${modelPart}`;
  }

  return `${accent(`${ICONS.provider} ${provider.toUpperCase()}`)} ${muted("")} ${modelPart}`;
}

export default function precisionFooter(pi: ExtensionAPI) {
  let codexLimit: CodexLimit | null = null;
  let refreshing = false;
  let requestRender: (() => void) | undefined;

  const refreshCodex = async (ctx: ExtensionContext) => {
    if (ctx.model?.provider !== "openai-codex") {
      codexLimit = null;
      requestRender?.();
      return;
    }
    if (refreshing) return;
    refreshing = true;
    codexLimit = await readCodexLimit();
    refreshing = false;
    requestRender?.();
  };

  pi.on("session_start", (_event, ctx) => {
    if (ctx.mode !== "tui") return;
    ctx.ui.setFooter((tui, theme, footerData) => {
      requestRender = () => tui.requestRender();
      const unsubscribe = footerData.onBranchChange(requestRender);
      return {
        dispose() {
          unsubscribe();
          requestRender = undefined;
        },
        invalidate() {},
        render(width: number): string[] {
          const accent = (text: string) => theme.fg("accent", text);
          const muted = (text: string) => theme.fg("dim", text);
          const tiers: LayoutTier[] = [layoutTier(width), "compact", "minimal"];
          for (const tier of [...new Set(tiers)]) {
            const left = projectPart(ctx, footerData.getGitBranch(), tier, accent, muted);
            const right = providerPart(ctx, tier, codexLimit, accent, muted);
            const gap = width - visibleWidth(left) - visibleWidth(right);
            if (gap < 1) continue;
            let middle = "";
            if (tier === "full") {
              const statuses = [...footerData.getExtensionStatuses().values()].join(" ");
              if (statuses && visibleWidth(statuses) + 2 <= gap) middle = ` ${statuses} `;
            }
            const padding = " ".repeat(Math.max(1, gap - visibleWidth(middle)));
            return [left + middle + padding + right, ""];
          }
          const fallback = `${projectPart(ctx, null, "minimal", accent, muted)} ${providerPart(ctx, "minimal", codexLimit, accent, muted)}`;
          return [truncateToWidth(fallback, width, ""), ""];
        },
      };
    });
    void refreshCodex(ctx);
  });

  pi.on("model_select", (_event, ctx) => {
    void refreshCodex(ctx);
  });
  pi.on("thinking_level_select", (_event, _ctx) => requestRender?.());
  pi.on("message_end", (_event, _ctx) => requestRender?.());
  pi.on("agent_settled", (_event, ctx) => {
    void refreshCodex(ctx);
  });
}
