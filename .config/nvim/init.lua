-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.g.neovide_opacity = 0.9
  vim.g.neovide_normal_opacity = 0.9 -- Put anything you want to happen only in Neovide here
end
