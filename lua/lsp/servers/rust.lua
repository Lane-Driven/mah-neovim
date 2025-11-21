-- lua/lsp/servers/rust.lua

local M = {}

M.setup = function(on_attach, capabilities)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function(args)
            local bufnr = args.buf

            -- Detect project root
            local root = vim.fs.root(bufnr, { "Cargo.toml", "rust-project.json" })
            if not root then
                return -- Don't start rust-analyzer outside a project
            end

            vim.lsp.start({
                name = "rust-analyzer",
                cmd = { "rust-analyzer" },
                root_dir = root,
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },
                        check = { command = "clippy" }, -- modern API
                    },
                },
            })
        end,
    })
end

return M

