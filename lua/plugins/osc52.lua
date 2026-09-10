-- Route the `+`/`*` registers through `clip`, which reaches the local machine's
-- clipboard over OSC 52. AstroNvim sets clipboard=unnamedplus, but over ssh
-- there is no clipboard tool for Neovim to hand `+` to, so yanks go nowhere.
--
-- Without `clip` on PATH this is a no-op and Neovim's own provider detection
-- applies. Paste reads the unnamed register, since the local clipboard cannot
-- be read back over this channel -- pasting in stays the terminal's paste key.

local clip = vim.fn.exepath "clip"

if clip ~= "" then
  local function paste() return vim.split(vim.fn.getreg '"', "\n") end

  vim.g.clipboard = {
    name = "osc52-clip",
    copy = { ["+"] = { clip }, ["*"] = { clip } },
    paste = { ["+"] = paste, ["*"] = paste },
    cache_enabled = true,
  }
end

-- lazy.nvim imports this as a plugin spec; only the side effect above matters
return {}
