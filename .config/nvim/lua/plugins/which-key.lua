return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    if opts.specs then
      opts.specs["<leader>a"] = { name = "+AI" }
    end
    return opts
  end,
}
