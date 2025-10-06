return {
  "vuki656/package-info.nvim",
  ft = "json",
  dependencies = "MunifTanjim/nui.nvim",
  opts = {
    highlights = {
      up_to_date = { -- highlight for up to date dependency virtual text
        fg = "#3C4048",
      },
      outdated = { -- highlight for outdated dependency virtual text
        fg = "##f1ff5e",
      },
      invalid = { -- highlight for invalid dependency virtual text
        fg = "#ee4b2b",
      },
    },
    icons = {
      enable = true, -- Whether to display icons
      style = {
        up_to_date = "|  ", -- Icon for up to date dependencies
        outdated = "|  ", -- Icon for outdated dependencies
      },
    },
    hide_up_to_date = true,
  },
}
