return {
  "olimorris/codecompanion.nvim",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "folke/noice.nvim",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "copilot",
      },
    },
    display = {
      action_palette = {
        width = 95,
        height = 10,
        prompt = "Prompt ", -- Prompt used for interactive LLM calls
        provider = "default", -- default|telescope|mini_pick
        opts = {
          show_default_actions = true, -- Show the default actions in the action palette?
          show_default_prompt_library = true, -- Show the default prompt library in the action palette?
        },
      },
    },
  },
  init = function()
    require("plugins.codecompanion.companion-notification"):setup()
  end,
}
