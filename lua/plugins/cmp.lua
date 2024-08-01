---@type LazySpec
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"

    return require("astrocore").extend_tbl(opts, {
      filetype = {
        txt = {
          enabled = false,
        },
        gitcommit = {
          enabled = false,
        },
      },
      enabled = function()
        local context = require "cmp.config.context"
        local disabled = false
        disabled = disabled or (vim.api.nvim_buf_get_option(0, "buftype") == "prompt")
        disabled = disabled or (vim.fn.reg_recording() ~= "")
        disabled = disabled or (vim.fn.reg_executing() ~= "")
        disabled = disabled or context.in_treesitter_capture "comment"
        return not disabled
      end,
      mapping = {
        ["<CR>"] = cmp.mapping(function(fallback) cmp.mapping.confirm { select = true }(fallback) end),
        ["<Tab>"] = cmp.mapping(function(fallback) cmp.mapping.select_next_item { select = false }(fallback) end),
        ["<S-Tab>"] = cmp.mapping(function(fallback) cmp.mapping.select_prev_item {}(fallback) end),
        -- ["<ESC>"] = cmp.mapping(function(fallback)
        --  if cmp.visible then
        --    cmp.abort()
        --  else
        --    fallback()
        --  end
        -- end),
      },
    })
  end,
}
