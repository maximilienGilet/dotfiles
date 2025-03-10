-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- jj / jk to escape
vim.keymap.set("i", "jj", "<esc>", { noremap = true })
vim.keymap.set("i", "jk", "<esc>", { noremap = true })

-- tmux
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "window left" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "window down" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "window up" })

-- easy windows
vim.keymap.set("n", "<leader>ws", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>wS", "<cmd>split<cr>")

-- codecompanion
vim.keymap.set(
  { "n", "v" },
  "<leader>aa",
  "<cmd>CodeCompanionActions<cr>",
  { noremap = true, silent = true, desc = "AI actions" }
)
vim.keymap.set(
  { "n", "v" },
  "<leader>ac",
  "<cmd>CodeCompanionChat Toggle<cr>",
  { noremap = true, silent = true, desc = "AI chat" }
)
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true, desc = "Add to AI chat" })
