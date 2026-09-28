import { basename } from "node:path";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { truncateToWidth, visibleWidth } from "@earendil-works/pi-tui";

const LOGO = ["1110", "1010", "1101", "1001"] as const;

export function buildLogo(moduleWidth: number, moduleHeight: number): string[] {
  return LOGO.flatMap((row) =>
    Array.from({ length: moduleHeight }, () =>
      row
        .replaceAll("1", "█".repeat(moduleWidth))
        .replaceAll("0", " ".repeat(moduleWidth)),
    ),
  );
}

export function centerLine(line: string, width: number): string {
  const fitted = visibleWidth(line) > width
    ? line.includes("\x1b")
      ? truncateToWidth(line, width, "")
      : [...line].slice(0, width).join("")
    : line;
  return " ".repeat(Math.max(0, Math.floor((width - visibleWidth(fitted)) / 2))) + fitted;
}

export default function precisionSplash(pi: ExtensionAPI) {
  let visible = false;

  pi.on("session_start", (event, ctx) => {
    if (ctx.mode !== "tui") return;
    if (event.reason !== "startup") {
      visible = false;
      ctx.ui.setHeader(undefined);
      return;
    }

    visible = true;
    ctx.ui.setHeader((tui, theme) => {
      tui.terminal.clearScreen();
      return {
        invalidate() {},
        render(width: number): string[] {
          const compact = width < 32 || tui.terminal.rows < 24;
          const logo = buildLogo(compact ? 4 : 6, compact ? 2 : 3);
          const metadata = `${basename(ctx.cwd)} · ${ctx.model?.id ?? "no model"}`;
          const contentHeight = logo.length + 3;
          const availableHeight = Math.max(contentHeight, tui.terminal.rows - 6);
          const remainingHeight = availableHeight - contentHeight;
          const topPadding = Math.floor(remainingHeight / 2);
          const bottomPadding = remainingHeight - topPadding;
          return [
            ...Array.from({ length: topPadding }, () => ""),
            ...logo.map((line) => centerLine(theme.fg("text", line), width)),
            "",
            centerLine(theme.fg("muted", metadata), width),
            "",
            ...Array.from({ length: bottomPadding }, () => ""),
          ];
        },
      };
    });
  });

  pi.on("before_agent_start", (_event, ctx) => {
    if (!visible || ctx.mode !== "tui") return;
    visible = false;
    ctx.ui.setHeader(undefined);
  });
}
