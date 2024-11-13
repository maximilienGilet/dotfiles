return {
  "nvim-neotest/neotest",
  dependencies = {
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --",
          jest_test_discovery = false,
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
        ["neotest-vitest"] = {},
      },
    })
  end,
}
