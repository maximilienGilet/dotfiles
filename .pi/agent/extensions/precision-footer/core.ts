export type ContextTone = "success" | "warning" | "error";
export type LayoutTier = "full" | "compact" | "minimal";

export type Usage = {
  input: number;
  output: number;
  cacheRead: number;
};

export type CodexLimit = {
  remainingPercent: number;
  resetsAt: number;
};

const TENSORX_PRICES: Record<string, Usage> = {
  "z-ai/glm-5.3-flash": { input: 0.2, output: 0.5, cacheRead: 0.05 },
  "deepseek/deepseek-v4-flash-0731": { input: 0.25, output: 0.3, cacheRead: 0.06 },
  "deepseek/deepseek-v4.1-flash": { input: 0.5, output: 1.5, cacheRead: 0.13 },
};

export function meter(percent: number, cells = 10): { filled: number; empty: number; percent: number } {
  const normalized = Math.min(100, Math.max(0, percent));
  const filled = Math.round((normalized / 100) * cells);
  return { filled, empty: cells - filled, percent: normalized };
}

export function contextTone(percent: number): ContextTone {
  if (percent >= 90) return "error";
  if (percent >= 70) return "warning";
  return "success";
}

export function layoutTier(width: number): LayoutTier {
  if (width >= 100) return "full";
  if (width >= 72) return "compact";
  return "minimal";
}

export function formatReset(resetAt: number, now = Date.now()): string {
  const totalMinutes = Math.floor((resetAt * 1000 - now) / 60_000);
  if (totalMinutes <= 0) return "maintenant";
  const days = Math.floor(totalMinutes / 1440);
  const hours = Math.floor((totalMinutes % 1440) / 60);
  const minutes = totalMinutes % 60;
  if (days) return `${days}j${hours}h`;
  if (hours) return `${hours}h${minutes}m`;
  return `${minutes}m`;
}

export function calculateTensorXCost(model: string, usage: Usage): number | null {
  const price = TENSORX_PRICES[model];
  if (!price) return null;
  return (
    usage.input * price.input +
    usage.output * price.output +
    usage.cacheRead * price.cacheRead
  ) / 1_000_000;
}

export function parseCodexRateLimits(value: unknown): CodexLimit | null {
  if (!value || typeof value !== "object") return null;
  const rateLimits = (value as { rateLimits?: unknown }).rateLimits;
  if (!rateLimits || typeof rateLimits !== "object") return null;
  const primary = (rateLimits as { primary?: unknown }).primary;
  if (!primary || typeof primary !== "object") return null;
  const { usedPercent, resetsAt } = primary as {
    usedPercent?: unknown;
    resetsAt?: unknown;
  };
  if (typeof usedPercent !== "number" || typeof resetsAt !== "number") return null;
  return {
    remainingPercent: Math.min(100, Math.max(0, 100 - usedPercent)),
    resetsAt,
  };
}
