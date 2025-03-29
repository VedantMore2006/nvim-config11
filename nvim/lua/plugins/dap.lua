return {
  { "mfussenegger/nvim-dap",
    config = function()
    local dap = require("dap")
    dap.adapters.python = {
      type = "executable",
      command = "python3",
      args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch File",
        program = "${file}",
        pythonPath = "python3",
      },
    }
    end,
  },
}
