local M = {}

-- Helper function to get current window and buffer
function M.save_context()
    return {
        win = vim.api.nvim_get_current_win(),
        buf = vim.api.nvim_get_current_buf(),
    }
end

-- Helper function to restore and refresh saved window and buffer
function M.restore_context(ctx)
    if vim.api.nvim_win_is_valid(ctx.win) then
        vim.api.nvim_set_current_win(ctx.win)
    end
    if vim.api.nvim_buf_is_valid(ctx.buf) then
        vim.api.nvim_set_current_buf(ctx.buf)
    end

    -- Refresh Netrw
    vim.cmd("edit")
end

-- Helper function to get current Netrw directory and entry 
-- at the cursor position. Returns a table with dot access.
-- Recommended usage:
-- local target = cur_dir_entry()
function M.cur_dir_entry()
    local entry = vim.fn.expand("<cfile>")
    if entry == "" then
        return nil
    end

    -- Returns a table with .dir, .entry access
    return {
        dir = vim.b.netrw_curdir,
        entry = entry,
    }
end

return M
