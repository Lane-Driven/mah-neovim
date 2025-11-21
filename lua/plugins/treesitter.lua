return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "rust",
                "javascript",
                "toml",
                "json",
                "yaml",
                "bash",
                "markdown",
                "markdown_inline",
                "cpp",
                "c",
                "go",
                "fortran",
                "html",
                "java",
                "php",
                "perl",
                "ocaml",
                "sql",
                "zig",
            },
            auto_install = true,        -- Install missing parsers when entering buffer automatically
            sync_install = false,       -- Allow continuing without fully installing
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
