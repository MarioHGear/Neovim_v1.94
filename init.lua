-- Cargar configuraciones base
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
require("config.options")
require("config.keymaps")
require("config.autocmds")
-- Inicializar Lazy
require("config.lazy")
-- activar tema
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        vim.cmd("colorscheme deththeme")
    end,
})
-- Aplicar el tema también al entrar en buffers de Python
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        -- Pequeño retraso para asegurar que otros plugins han terminado de configurar el buffer
        vim.defer_fn(function()
            vim.cmd("colorscheme deththeme")
        end, 50)
    end,
})
