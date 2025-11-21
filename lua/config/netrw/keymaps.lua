local actions = require("config.netrw.actions")

local M = {}

function M.apply(bufnr)
    local map = vim.keymap.set
    local opts = { buffer = bufnr, nowait = true }

    -- New file: n
    map("n", "n", actions.create_file, opts)

    -- New directory: d
    map("n", "d", actions.create_directory, opts)

    -- Rename: R
    map("n", "R", actions.rename_entry, opts)

    -- Delete: D
    map("n", "D", actions.delete_entry, opts)

    -- Return to Dashboard
    map("n", "<leader>hd", vim.cmd.Dashboard, opts)
    
end

return M

