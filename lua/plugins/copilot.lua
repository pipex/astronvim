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
  event = "InsertEnter",
  config = function()
    require("copilot").setup {
      filetypes = {
        javascript = true,
        typescript = function()
          if is_private_project() then return false end
          return true
        end,
        lua = true,
        rust = function()
          if is_private_project() then return false end
          return true
        end,
        ["*"] = false,
      },
      server_opts_overrides = {
        delayCompletions = 1000,
      },
    }
  end,
  specs = {
    {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        local cmp, copilot = require "cmp", require "copilot.suggestion"
        local snip_status_ok, luasnip = pcall(require, "luasnip")
        if not snip_status_ok then return end

        -- disable cmp autocomplete if copilot is enabled
        cmp.setup {
          completion = {
            autocomplete = (function()
              local cmd, types = require "copilot.command", require "cmp.types"
              local status = cmd.status()
              if status ~= nil and string.find(status, "Enabled") then return false end
              -- use default autocomplete configuration
              return { types.cmp.TriggerEvent.TextChanged }
            end)(),
          },
        }

        -- if cmp menu is open, then hide copilot
        cmp.event:on("menu_opened", function() vim.b.copilot_suggestion_hidden = true end)
        cmp.event:on("menu_closed", function() vim.b.copilot_suggestion_hidden = false end)

        -- handle <tab> key depending on if copilot/cmp visibility
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
