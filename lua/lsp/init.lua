require("lsp.diagnostics")
require("lsp.ui")

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Future Optional: add cmp_nvim_lsp for auto completion when using nvim-cmp
--pcall(function()
--    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
--end)

local function on_attach(client, bufnr)
    require("lsp.keymaps").setup(client, bufnr)
end



-- Load each server file
require("lsp.servers.rust").setup(on_attach, capabilities)
-- Add more:
-- require("lsp.servers.lua_ls").setup(on_attach, capabilities)
