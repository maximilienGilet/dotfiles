return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        explorer = {
          -- your explorer configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
          layout = { layout = { position = "right" } },
          hidden = true,
          win = {
            list = {
              keys = {
                ["-"] = "edit_split",
                ["|"] = "edit_vsplit",
                ["<CR>"] = "confirm",
                ["o"] = "confirm",
                ["O"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                ["<BS>"] = "explorer_up",
                ["a"] = "explorer_add",
                ["d"] = "explorer_del",
                ["r"] = "explorer_rename",
                ["c"] = "explorer_copy",
                ["p"] = "explorer_paste",
                ["u"] = "explorer_update",
                ["<C-t>"] = "terminal",
                ["x"] = "explorer_move",
                ["y"] = "explorer_yank",
                ["<c-c>"] = "explorer_cd",
                ["."] = "explorer_focus",
                ["I"] = "toggle_ignored",
                ["H"] = "toggle_hidden",
                ["Z"] = "explorer_close_all",
              },
            },
          },
        },
      },
    },
  },
}
