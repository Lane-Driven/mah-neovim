-- lua/lsp/keymaps.lua

local M = {}

M.setup = function(client, bufnr)
    local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("n", "K", vim.lsp.buf.hover, "Hover info")
    map("n", "gd", vim.lsp.buf.definition, "Goto definition")
    map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
    map("n", "gr", vim.lsp.buf.references, "List references")

    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")

    map("n", "<leader>df", vim.diagnostic.open_float, "Diagnostic float")
    map("n", "<leader>dp", vim.diagnostic.goto_prev, "Prev diagnostic")
    map("n", "<leader>dn", vim.diagnostic.goto_next, "Next diagnostic")
end

return M

