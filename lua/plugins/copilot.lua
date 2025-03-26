local function is_private_project()
  -- Check package.json for "private": true
  local package_json = vim.fn.findfile("package.json", ".;")
  if package_json ~= "" then
    local file = io.open(package_json, "r")
    if file then
      local content = file:read "*all"
      file:close()
      if content:match '"private"%s*:%s*true' then return true end
    end
  end

  -- Check Cargo.toml for "publish = false"
  local cargo_toml = vim.fn.findfile("Cargo.toml", ".;")
  if cargo_toml ~= "" then
    local file = io.open(cargo_toml, "r")
    if file then
      local content = file:read "*all"
      file:close()
      if content:match "publish%s*=%s*false" then return true end
    end
  end

  return false
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
      javascript = true,
      typescript = function()
        if is_private_project() then return false end
        return true
      end,
      lua = true,
      go = true,
      rust = function()
        if is_private_project() then return false end
        return true
      end,
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
  },
}
