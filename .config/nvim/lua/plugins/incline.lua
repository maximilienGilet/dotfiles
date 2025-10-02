return {
  "b0o/incline.nvim",
  config = function()
    require("incline").setup({
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local devicons = require("nvim-web-devicons")
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local lualine = require("lualine")
        local theme_name = lualine.get_config().options.theme
        local theme = require("lualine.themes." .. theme_name)

        local function get_diagnostic_label()
          local label = {}

          for severity, icon in pairs(LazyVim.config.icons.diagnostics) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
            end
          end
          return label
        end
        local helpers = require("incline.helpers")
        return {
          { get_diagnostic_label() },
          {
            guibg = props.focused and ft_color or helpers.contrast_color(ft_color),
            guifg = props.focused and helpers.contrast_color(ft_color) or ft_color,
            ft_icon and { " ", ft_icon, " " } or "",
            filename .. " ",
          },
          { modified and "  " or "", guifg = theme.insert.a.fg },
        }
      end,
    })
  end,
  -- Optional: Lazy load Incline
  event = "VeryLazy",
}
