local function is_public_project()
  -- Check package.json for "private": true
  local package_json = vim.fn.findfile("package.json", ".;")
  if package_json ~= "" then
    local file = io.open(package_json, "r")
    if file then
      local content = file:read "*all"
      file:close()
      if content:match '"private"%s*:%s*true' then return false end
    end
  end

  -- Check Cargo.toml for "publish = false"
  local cargo_toml = vim.fn.findfile("Cargo.toml", ".;")
  if cargo_toml ~= "" then
    local file = io.open(cargo_toml, "r")
    if file then
      local content = file:read "*all"
      file:close()
      if content:match "publish%s*=%s*false" then return false end
    end
  end

  return true
end

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      keymap = {
        accept = false, -- handled by completion engine
        next = "<C-x>",
        prev = "<C-z>",
      },
    },
    filetypes = {
      javascript = is_public_project,
      typescript = is_public_project,
      lua = true,
      go = true,
      rust = is_public_project,
      nix = true,
      sh = true,
      ["*"] = false,
    },
    server_opts_overrides = {
      delayCompletions = 1000,
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- set the ai_accept function
            ai_accept = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
                return true
              end
            end,
          },
        },
      },
    },
    {
      "Saghen/blink.cmp",
      opts = {
        enabled = function()
          if require("copilot.suggestion").is_visible() then return false end
          return true
        end,
      },
    },
  },
}
