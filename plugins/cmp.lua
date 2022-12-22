local cmp_ok, cmp = pcall(require, "cmp")
local copilot = require("copilot.suggestion")
if not cmp_ok then
  return {}
end

cmp.event:on("menu_opened", function()
  vim.b.copilot_suggestion_hidden = true
end)

cmp.event:on("menu_closed", function()
  vim.b.copilot_suggestion_hidden = false
end)

return {
  mapping = {
    ["<CR>"] = cmp.mapping(function(fallback)
      if copilot.is_visible() then
        copilot.accept()
      else
        cmp.mapping.confirm({ select = false })(fallback)
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
}
