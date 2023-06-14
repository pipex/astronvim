return {
  { "AstroNvim/astrocommunity",                          dev = false },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      -- I don't need eslint for now
      local formatters = {}
      for k, v in ipairs(opts.ensure_installed) do
        if v ~= "eslint_d" then formatters[k] = v end
      end
      opts.ensure_installed = formatters

      local handlers = {}
      for k, v in pairs(opts.handlers) do
        if k ~= "eslint_d" then handlers[k] = v end
      end
      opts.handlers = handlers
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    opts = {},
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "mxsdev/nvim-dap-vscode-js",
        opts = { debugger_cmd = { "js-debug-adapter" }, adapters = { "pwa-node" } },
      },
      { "theHamsta/nvim-dap-virtual-text", config = true },
    },
    config = function()
      local dap = require "dap"

      local attach_node = {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      }

      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        attach_node,
      }
      dap.configurations.typescript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "ts-node",
          sourceMaps = true,
          protocol = "inspector",
          console = "integratedTerminal",
          resolveSourceMapLocations = {
            "${workspaceFolder}/dist/**/*.js",
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
        },
        attach_node,
      }
    end,
  },
}
