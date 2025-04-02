-- return {
--   {
--     "catppuccin",
--     opts = {
--       transparent_background = not vim.g.neovide,
--       styles = {
--         comments = { "italic" },
--         keywords = { "italic" },
--       },
--     },
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
-- }

return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    italic_comments = true,
  },
}
