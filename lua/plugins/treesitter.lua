return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "python",
            "lua",
            "bash",
            "markdown",
            "latex"
        },

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        indent = { enable = true },
    },
}
