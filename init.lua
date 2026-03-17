-- Cargar configuraciones base
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Inicializar Lazy
require("config.lazy")
-- activar tema
vim.cmd("colorscheme deththeme")
