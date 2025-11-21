local border = "rounded"

-- Hover window
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {
        border = border,
        max_width = 80,
        max_height = 30,
        focuasable = false,
    }
)

-- Signature help window
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
        border = border,
        focusable = false,
    }
)

-- Diagnostic float border styling
vim.diagnostic.config({
    float = {
        border = border,
        max_width = 80,
        source = "always",
        header = "",
        prefix = "",
    },
})


