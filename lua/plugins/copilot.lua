local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local function copilot_action(action)
  local copilot = require "copilot.suggestion"
  return function()
    if copilot.is_visible() then
      copilot[action]()
      return true -- doesn't run the next command
    end
  end
end

return {
  "zbirenbaum/copilot.lua",
  specs = {
    { import = "astrocommunity.completion.copilot-lua" },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        {
          "zbirenbaum/copilot.lua",
          opts = {
            suggestion = {
              debounce = 1000,
            },
          },
        },
      },
      opts = function(_, opts)
        local cmp, copilot = require "cmp", require "copilot.suggestion"
        local snip_status_ok, luasnip = pcall(require, "luasnip")
        if not snip_status_ok then return end

        if not opts.mapping then opts.mapping = {} end
        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if copilot.is_visible() then
            copilot.accept()
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

        opts.mapping["<C-X>"] = cmp.mapping(copilot_action "next")
        opts.mapping["<C-Z>"] = cmp.mapping(copilot_action "prev")
        opts.mapping["<C-Right>"] = cmp.mapping(copilot_action "accept_word")
        opts.mapping["<C-L>"] = cmp.mapping(copilot_action "accept_word")
        opts.mapping["<C-Down>"] = cmp.mapping(copilot_action "accept_line")
        opts.mapping["<C-J>"] = cmp.mapping(copilot_action "accept_line")
        opts.mapping["<C-C>"] = cmp.mapping(function(fallback)
          if copilot.is_visible() then
            copilot.dismiss()
          else
            fallback()
          end
        end)
        opts.mapping["<ESC>"] = cmp.mapping(function(fallback)
          if copilot.is_visible() then
            copilot.dismiss()
          else
            fallback()
          end
        end)
      end,
    },
  },
}
