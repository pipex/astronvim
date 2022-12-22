local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return {}
end

cmp.event:on("menu_opened", function()
  vim.b.copilot_suggestion_hidden = true
end)

cmp.event:on("menu_closed", function()
  vim.b.copilot_suggestion_hidden = false
end)

return {}
