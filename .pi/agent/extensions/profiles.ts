import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

type Profile = {
  provider: string;
  model: string;
  thinking?: "off" | "minimal" | "low" | "medium" | "high" | "xhigh";
};

const profiles: Record<string, Profile> = {
  codex: {
    provider: "openai-codex",
    model: "gpt-6-sol",
    thinking: "medium",
  },

  tensorx: {
    provider: "tensorx",
    model: "deepseek/deepseek-v4.1-flash",
  },
};

export default function profilesExtension(pi: ExtensionAPI) {
  async function applyProfile(
    name: string,
    ctx: Parameters<
      NonNullable<Parameters<typeof pi.registerCommand>[1]["handler"]>
    >[1],
  ) {
    const profile = profiles[name];

    if (!profile) {
      ctx.ui.notify(
        `Unknown profile "${name}". Available: ${Object.keys(profiles).join(", ")}`,
        "error",
      );
      return;
    }

    const model = ctx.modelRegistry.find(profile.provider, profile.model);

    if (!model) {
      ctx.ui.notify(
        `Model not found: ${profile.provider}/${profile.model}`,
        "error",
      );
      return;
    }

    const success = await pi.setModel(model);

    if (!success) {
      ctx.ui.notify(
        `No authentication configured for ${profile.provider}/${profile.model}`,
        "error",
      );
      return;
    }

    if (profile.thinking) {
      pi.setThinkingLevel(profile.thinking);
    }

    ctx.ui.notify(
      `Profile: ${name} → ${profile.provider}/${profile.model}${
        profile.thinking ? ` (${profile.thinking})` : ""
      }`,
      "info",
    );
  }

  pi.registerCommand("profile", {
    description: "Switch model profile",

    getArgumentCompletions: (prefix) => {
      const names = Object.keys(profiles).filter((name) =>
        name.startsWith(prefix),
      );

      return names.length
        ? names.map((name) => ({
            value: name,
            label: name,
          }))
        : null;
    },

    handler: async (args, ctx) => {
      const name = args.trim().toLowerCase();

      if (!name) {
        const selected = await ctx.ui.select(
          "Select profile",
          Object.keys(profiles),
        );

        if (!selected) return;

        await applyProfile(selected, ctx);
        return;
      }

      await applyProfile(name, ctx);
    },
  });
}
