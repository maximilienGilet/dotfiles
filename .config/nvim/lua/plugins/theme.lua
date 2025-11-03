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
    transparent = false,
    italic_comments = true,
    colors = {
      bg = "#000000",
      -- For a list of colors see `lua/cyberdream/colours.lua`
      -- Example:
      grey = "#caced5",
      green = "#00ff00",
      magenta = "#ff00ff",
      -- invert blue & cyan
      cyan = "#5ea1ff",
      blue = "#5ef1ff",
    },
  },
}
