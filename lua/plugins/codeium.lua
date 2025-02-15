local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  specs = {
    {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        local cmp, neocodeium = require "cmp", require "neocodeium"
        local snip_status_ok, luasnip = pcall(require, "luasnip")
        if not snip_status_ok then return end

        neocodeium.setup {
          filter = function()
            local allowed_filetypes = {
              rust = true,
              typescript = true,
              lua = true,
              javascript = true,
            }
            return allowed_filetypes[vim.bo.filetype] and not cmp.visible()
          end,
          silent = true,
        }
        cmp.setup {
          completion = {
            autocomplete = false,
          },
        }

        if not opts.mapping then opts.mapping = {} end
        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if neocodeium.visible() then
            neocodeium.accept()
          elseif cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" })

        opts.mapping["<C-X>"] = cmp.mapping(function(fallback)
          if neocodeium.visible() then
            neocodeium.cycle_or_complete()
          else
            fallback()
          end
        end)
        opts.mapping["<C-C>"] = cmp.mapping(function(fallback)
          if neocodeium.visible() then
            neocodeium.clear()
          else
            fallback()
          end
        end)
        opts.mapping["<ESC>"] = cmp.mapping(function(fallback)
          if neocodeium.visible() then
            neocodeium.clear()
          else
            fallback()
          end
        end)
      end,
    },
  },
}
