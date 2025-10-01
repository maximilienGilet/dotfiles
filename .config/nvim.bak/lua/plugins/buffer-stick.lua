return {
  "ahkohd/buffer-sticks.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>j",
      function()
        BufferSticks.jump()
      end,
      desc = "Buffer jump mode",
    },
  },
  config = function()
    local sticks = require("buffer-sticks")
    sticks.setup({
      filter = { buftypes = { "terminal" } },
      highlights = {
        active = { link = "Statement" },
        inactive = { link = "Whitespace" },
        label = { link = "Comment" },
      },
    })
    sticks.show()
  end,
}
