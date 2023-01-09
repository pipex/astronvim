return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require "dap"
    dap.adapters.python = {
      type = "executable",
      command = "/usr/bin/python",
      args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",

        program = "${file}",
        pythonPath = function() return "python" end,
      },
    }
  end,
}
