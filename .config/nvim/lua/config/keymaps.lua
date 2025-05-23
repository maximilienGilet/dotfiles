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
vim.keymap.set("n", "<leader>ws", "<cmd>vsplit<cr>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>wS", "<cmd>split<cr>", { desc = "Split horizontally" })

-- tabs
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabn<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabp<cr>", { desc = "Prev tab" })

-- duplicate & comment line
vim.keymap.set("n", "ycc", "yygccp", { remap = true, desc = "Duplicate & copy line" })

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
