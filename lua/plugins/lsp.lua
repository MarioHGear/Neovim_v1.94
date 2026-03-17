return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- DESACTIVAR PYRIGHT
      vim.lsp.enable("pyright", false)

      -- BASEDPYRIGHT
      vim.lsp.config("basedpyright", {
        capabilities = capabilities,
        settings = {
          basedpyright = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              typeCheckingMode = "basic",
              useLibraryCodeForTypes = false,
              indexing =  false,
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

      vim.lsp.enable("basedpyright")

      -- LUA
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.enable("lua_ls")

    end,
  },
}
