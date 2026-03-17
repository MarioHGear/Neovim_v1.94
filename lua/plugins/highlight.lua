return {
    "RRethy/vim-illuminate",
    config = function()
        require("illuminate").configure({
            providers = { "lsp", "treesitter", "regex" },
            delay = 100,
            filetypes_denylist = {
                "dirvish",
                "fugitive",
                "alpha",
                "NvimTree",
                "lazy",
                "TelescopePrompt",
            },
        })
        -- Personalizar el resaltado aquí mismo
        vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = '#3a3a3a' })
        vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg = '#3a3a3a' })
        vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg = '#3a3a3a' })
    end,
}
