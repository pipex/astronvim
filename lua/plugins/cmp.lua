---@type LazySpec
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp, copilot = require "cmp", require "copilot.suggestion"

    cmp.event:on("menu_opened", function() vim.b.copilot_suggestion_hidden = true end)
    cmp.event:on("menu_closed", function() vim.b.copilot_suggestion_hidden = false end)

    return require("astrocore").extend_tbl(opts, {
      mapping = {
        ["<CR>"] = cmp.mapping(function(fallback)
          if copilot.is_visible() then
            copilot.accept()
          else
            cmp.mapping.confirm { select = false }(fallback)
          end
        end),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if copilot.is_visible() then
            copilot.next()
          else
            fallback()
          end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if copilot.is_visible() then
            copilot.prev()
          else
            fallback()
          end
        end),
        ["<C-c>"] = cmp.mapping(function(fallback)
          if copilot.is_visible() then
            copilot.dismiss()
          else
            fallback()
          end
        end),
        ["<ESC>"] = cmp.mapping(function(fallback)
          if copilot.is_visible() then
            copilot.dismiss()
          else
            fallback()
          end
        end),
      },
    })
  end,
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      opts = {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 1000,
          keymap = {
            next = "<C-]>",
            dismiss = "<C-\\>",
          },
        },
      },
    },
  },
}
