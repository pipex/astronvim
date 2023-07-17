return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "mxsdev/nvim-dap-vscode-js",
      dependencies = {
        {
          "microsoft/vscode-js-debug",
          opt = true,
          build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
        },
      },
      opts = {
        debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node" },
      },
    },
    { "theHamsta/nvim-dap-virtual-text", config = true },
  },
  config = function()
    local dap = require "dap"

    dap.set_log_level "DEBUG"

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
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Mocha Tests",
        -- trace = true, -- include debugger info
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/mocha/bin/mocha.js",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
    }
  end,
}
