return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "rust_analyzer",
            },
        },
    },

    -- Use the NEW builtin LSP API instead of nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-org/mason-lspconfig.nvim" },
        config = function()
            -------------------------------------------------------------------
            -- NEW: Builtin LSP configuration (Neovim 0.11+)
            -------------------------------------------------------------------
            vim.lsp.config["rust_analyzer"] = {
                cmd = { "rust-analyzer" },
                filetypes = { "rust" },
                root_markers = { "Cargo.toml", "rust-project.json", ".git" },

                settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },
                        check = { command = "clippy" },
                    },
                },
            }

            -- Enable it
            vim.lsp.enable("rust_analyzer")
        end,
    },
}

