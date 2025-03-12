return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        explorer = {
          -- your explorer configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
          layout = { layout = { position = "right" } },
          hidden = true,
        },
      },
    },
  },
}
