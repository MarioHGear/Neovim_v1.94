return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate", "TSInstallInfo", "TSInstallSync" },
    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = { "python", "lua", "bash", "markdown", "latex" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
