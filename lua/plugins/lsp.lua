return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Configuración de PYRIGHT (no basedpyright)
            vim.lsp.config("pyright", {
                capabilities = capabilities,
                settings = {
                    pyright = {
                        -- Puedes copiar aquí las opciones de análisis que tenías en basedpyright,
                        -- pero adaptadas a pyright (la estructura es ligeramente diferente)
                        disableOrganizeImports = false,
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            typeCheckingMode = "basic",
                            useLibraryCodeForTypes = false,
                            indexing = false,
                            stubPath = "typings",
                            exclude = {
                                "**/node_modules",
                                "**/__pycache__",
                                "**/.venv",
                                "**/build",
                                "**/.git",
                                "**/dist",
                            },
                        },
                    },
                },
            })

            vim.lsp.enable("pyright") -- <-- Activar pyright

            -- Configuración de Lua (opcional, pero la tenías)
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })
            vim.lsp.enable("lua_ls")
        end,
    },
}
