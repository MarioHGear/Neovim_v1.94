return {
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            -- Función global para nuevo archivo Python
            _G.new_python_file = function()
                local filename = vim.fn.input("Python Name: ")
                if filename == "" then
                    print("Operación cancelada")
                    return
                end
                if not filename:match("%.py$") then
                    filename = filename .. ".py"
                end
                vim.cmd("e " .. vim.fn.fnameescape(filename))
                vim.bo.filetype = "python"
                local skeleton = {}
                vim.api.nvim_buf_set_lines(0, 0, -1, false, skeleton)
            end

            local header_art = [[
██████ ██████   █████   ██████ ████████  █████  ██     ██████  ██████
██▒▒▒▒▒██▒▒▒██ ██▒▒▒██ ██▒▒▒▒▒▒ ▒▒██▒▒▒▒██▒▒▒██ ██▒     ▒▒▒▒▒██ ██▒▒▒██▒
█████  ██████▒▒███████▒██▒        ██▒   ███████▒██▒      █████▒▒██▒  ██▒
██▒▒▒▒ ██▒▒▒██▒██▒▒▒██▒██▒        ██▒   ██▒▒▒██▒██▒       ▒▒▒██ ██▒  ██▒
██▒    ██▒  ██▒██▒  ██▒ ██████    ██▒   ██▒  ██▒███████ ██████▒▒██████▒▒
 ▒▒     ▒▒   ▒▒ ▒▒   ▒▒  ▒▒▒▒▒▒    ▒▒    ▒▒   ▒▒ ▒▒▒▒▒▒▒ ▒▒▒▒▒▒  ▒▒▒▒▒▒
                           ┳┳┓┏┓┏┓┳┓┳┏┓┳┓┳┏┓
                           ┃┃┃┃┓┣ ┃┃┃┣ ┣┫┃┣┫
                           ┻┛┗┗┛┗┛┛┗┻┗┛┛┗┻┛┗
               0100010001000101010000010101010001001000
                               MARI0.H
            ]]

            local lines = vim.split(header_art, "\n")
            if lines[1] == "" then table.remove(lines, 1) end

            dashboard.section.header.val = lines

            dashboard.section.buttons.val = {
                dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
                dashboard.button("p", "⚙  Python Code", ":lua new_python_file()<CR>"),
                dashboard.button("f", "  Search codes", ":Telescope find_files<CR>"),
                dashboard.button("q", "🔧︎ Exit", ":qa<CR>"),
            }

            alpha.setup(dashboard.config)
        end,
    },
}
