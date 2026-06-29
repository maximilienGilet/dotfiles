-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- jj / jk to escape
vim.keymap.set("i", "jj", "<esc>", { noremap = true })
vim.keymap.set("i", "jk", "<esc>", { noremap = true })

-- simgle keystroke command on colemak
vim.keymap.set({ "n", "v", "x" }, ";", ":")
vim.keymap.set({ "n", "v", "x" }, ":", ";")

-- navigate vim splits / herdr panes (herdr-aware, tmux fallback)
local function nav(wincmd, dir)
  local prev = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. wincmd)
  if vim.api.nvim_get_current_win() ~= prev then
    return
  end
  if vim.env.HERDR_PANE_ID and vim.env.HERDR_PANE_ID ~= "" then
    local herdr = vim.env.HERDR_BIN_PATH
    if herdr == nil or herdr == "" then
      herdr = "herdr"
    end
    vim.fn.system({ herdr, "pane", "focus", "--direction", dir, "--current" })
  elseif vim.env.TMUX and vim.env.TMUX ~= "" then
    local tmux = { left = "Left", down = "Down", up = "Up", right = "Right" }
    pcall(vim.cmd, "TmuxNavigate" .. tmux[dir])
  end
end

local function nmap(lhs, wincmd, dir, desc)
  vim.keymap.set("n", lhs, function()
    nav(wincmd, dir)
  end, { silent = true, noremap = true, desc = desc })
end

nmap("<C-h>", "h", "left", "Navigate left (vim/herdr)")
nmap("<C-j>", "j", "down", "Navigate down (vim/herdr)")
nmap("<C-k>", "k", "up", "Navigate up (vim/herdr)")
nmap("<C-l>", "l", "right", "Navigate right (vim/herdr)")

-- easy windows
vim.keymap.set("n", "<leader>ws", "<cmd>vsplit<cr>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>wS", "<cmd>split<cr>", { desc = "Split horizontally" })

vim.keymap.set("n", "<M-i>", "<cmd>vertical resize +5<CR>") -- Increase width
vim.keymap.set("n", "<M-e>", "<cmd>vertical resize -5<CR>") -- Decrease width

-- tabs
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabn<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabp<cr>", { desc = "Prev tab" })

-- duplicate & comment line
vim.keymap.set("n", "ycc", "yygccp", { remap = true, desc = "Duplicate & copy line" })

-- oil
vim.keymap.set("n", "-", "<CMD>Oil --preview<CR>", { desc = "Open parent directory" })

-- code lens
vim.keymap.set("n", "<leader>ct", "<cmd>LenslineToggleView<cr>", { desc = "Toggle lensline" })
vim.keymap.set("n", "<leader>cn", "<cmd>LenslineProfile<cr>", { desc = "Next lensline profile" })

-- package info
vim.keymap.set(
  { "n" },
  "<leader>cpt",
  require("package-info").toggle,
  { desc = "Toggle package info", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>cpu",
  require("package-info").update,
  { desc = "Update package", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>cpd",
  require("package-info").delete,
  { desc = "Delete package", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>cpi",
  require("package-info").install,
  { desc = "Install package", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>cpv",
  require("package-info").change_version,
  { desc = "Change package version", silent = true, noremap = true }
)
