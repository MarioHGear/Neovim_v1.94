return {

    "mfussenegger/nvim-dap",
    cmd = { "DapContinue", "DapToggleBreakpoint" },
    config = function()
        local dap = require("dap")

        dap.adapters.python = {
            type = "executable",
            command = "/home/deth/Desktop/01001101/Python_code/Python_exercice/engine/bin/python",
            args = { "-m", "debugpy.adapter" },
        }

        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Debug current file",
                program = "${file}",
                console = "integratedTerminal",
            },
        }
    end,


}
