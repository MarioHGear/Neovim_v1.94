return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Cargar el módulo que creamos para información de Python
        local python_info = require("config.python_info")

        require("lualine").setup({
            options = {
                theme = "auto",
                section_separators = "",
                component_separators = "",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = {
                    -- Mostrar el nombre del entorno virtual con un icono
                    { python_info.get_virtualenv_name, icon = "🐍" }
                },
                lualine_y = { "progress" },
                lualine_z = { "location" }
            }
        })
    end,
}
