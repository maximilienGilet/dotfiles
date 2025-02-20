return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true, -- Replace netrw with the snacks explorer
      layout = { preset = "sidebar", preview = false, position = "right" },
      -- your explorer configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    picker = {
      explorer = {
        layout = { preset = "sidebar", preview = false, position = "right" },
        -- your explorer picker configuration comes here
        -- or leave it empty to use the default settings
      },
    },
  },
}
