-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.title = true

-- Put anything you want to happen only in Neovide here
if vim.g.neovide then
  vim.o.guifont = "ZedMono Nerd Font Mono:h16"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)

  -- Allow clipboard copy paste in neovim
  vim.g.neovide_input_use_logo = 1
  -- Fix option key
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"

  -- Treat kebab-case as signle words
  vim.opt.iskeyword:append("-")

  vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
end
