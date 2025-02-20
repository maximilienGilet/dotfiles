return {
  {
    "catppuccin",
    opts = {
      transparent_background = not vim.g.neovide,
      styles = {
        comments = { "italic" },
        keywords = { "italic" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
