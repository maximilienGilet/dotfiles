return {
  "oribarilan/lensline.nvim",
  branch = "release/2.x",
  event = { "LspAttach", "BufWritePost" },
  config = function()
    require("lensline").setup({
      -- Profile definitions, first is default
      profiles = {
        -- {
        --   name = "default",
        --   providers = { -- Array format: order determines display sequence
        --     {
        --       name = "usages",
        --       enabled = true, -- enable usages provider by default (replaces references)
        --       include = { "refs" }, -- refs-only setup to match references provider behavior
        --       breakdown = true, -- false = aggregate count, true = breakdown by type
        --       show_zero = true, -- show zero counts when LSP supports the capability
        --       labels = {
        --         refs = "refs",
        --         impls = "impls",
        --         defs = "defs",
        --         usages = "usages",
        --       },
        --       icon_for_single = "󰌹 ", -- icon when only one attribute or aggregate display
        --       inner_separator = ", ", -- separator between breakdown items
        --     },
        --   },
        --   style = {
        --     separator = " • ", -- separator between all lens attributes
        --     highlight = "Comment", -- highlight group for lens text
        --     prefix = "┃ ", -- prefix before lens content
        --     placement = "inline", -- "above" | "inline" - where to render lenses (consider prefix = "" for inline)
        --     use_nerdfont = true, -- enable nerd font icons in built-in providers
        --     render = "all", -- "all" | "focused" (only active window's focused function)
        --   },
        -- },
        {
          name = "informative",
          providers = {
            {
              name = "references_with_warning",
              enabled = true,
              event = { "LspAttach", "BufWritePost" },
              handler = function(bufnr, func_info, provider_config, callback)
                local utils = require("lensline.utils")

                utils.get_lsp_references(bufnr, func_info, function(references)
                  if references then
                    local count = #references
                    local icon, text

                    if count == 0 then
                      icon = utils.if_nerdfont_else("⚠️ ", "WARN ")
                      text = icon .. "No references"
                    else
                      icon = utils.if_nerdfont_else("󰌹 ", "")
                      local suffix = utils.if_nerdfont_else("", " refs")
                      text = icon .. count .. suffix
                    end

                    callback({ line = func_info.line, text = text })
                  else
                    callback(nil)
                  end
                end)
              end,
            },
            {
              name = "usages",
              enabled = true, -- enable usages provider by default (replaces references)
              include = { "refs" }, -- refs-only setup to match references provider behavior
              breakdown = true, -- false = aggregate count, true = breakdown by type
              show_zero = true, -- show zero counts when LSP supports the capability
              labels = {
                refs = "refs",
                impls = "impls",
                defs = "defs",
                usages = "usages",
              },
              icon_for_single = "󰌹 ", -- icon when only one attribute or aggregate display
              inner_separator = ", ", -- separator between breakdown items
            },
            {
              name = "unused_detector",
              enabled = true,
              event = { "LspAttach", "BufWritePost" },
              handler = function(bufnr, func_info, provider_config, callback)
                local utils = require("lensline.utils")

                utils.get_lsp_references(bufnr, func_info, function(references)
                  if references and #references == 0 then
                    local icon = utils.if_nerdfont_else("🚫 ", "")
                    callback({
                      line = func_info.line,
                      text = icon .. "Unused",
                    })
                  else
                    callback(nil) -- Only show for unused functions
                  end
                end)
              end,
            },
            {
              name = "last_author",
              enabled = true, -- enabled by default with caching optimization
              cache_max_files = 50, -- maximum number of files to cache blame data for (default: 50)
            },
            { name = "diagnostics", enabled = true, min_level = "HINT" },
            {
              name = "line_counter",
              enabled = true,
              event = { "BufWritePost", "TextChanged" },
              handler = function(bufnr, func_info, provider_config, callback)
                local utils = require("lensline.utils")
                local total_lines = vim.api.nvim_buf_line_count(bufnr)
                local func_lines = "?"

                if func_info.end_line then
                  func_lines = func_info.end_line - func_info.line + 1
                end

                local icon = utils.if_nerdfont_else("📏 ", "Lines: ")
                callback({
                  line = func_info.line,
                  text = string.format("%s%s/%d", icon, func_lines, total_lines),
                })
              end,
            },
            { name = "complexity", enabled = true, min_level = "S" },
          },
          style = { render = "all", placement = "above" },
        },
      },
    })
  end,
}
