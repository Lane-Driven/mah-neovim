local M = {}

-- Create the floating window and return its win id
local function create_float_window()
    local width  = math.floor(vim.o.columns * 0.7)
    local height = math.floor(vim.o.lines   * 0.7)

    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local buf = vim.api.nvim_create_buf(false, true)

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width    = width,
        height   = height,
        row      = row,
        col      = col,
        style    = "minimal",
        border   = "rounded",
    })

    return win
end

-- Close the floating window you're currently in
local function close_float()
    local win = vim.api.nvim_get_current_win()
    if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
    end
end

-- Apply keymaps to a netrw buffer
local function apply_maps(bufnr, mode)
    -- ESC always closes the float
    vim.keymap.set("n", "<Esc>", function()
        close_float()
    end, { buffer = bufnr, silent = true })

    if mode == "navigator" then
        -- Directory vs file behavior
        vim.keymap.set("n", "<CR>", function()
            local dir = vim.b.netrw_curdir
            local target = vim.fn.expand("<cfile>")
            local full = dir .. "/" .. target

            if vim.fn.isdirectory(full) == 1 then
                vim.cmd("edit " .. full)
                return
            end

            close_float()
            vim.cmd("edit " .. full)
        end, { buffer = bufnr, noremap = true, silent = true })
    end
end

-- Floating editor mode (edit files in the float)
function M.float_editor()
    local win = create_float_window()
    vim.cmd("edit .")

    -- Reapply keymaps EVERY time netrw reloads
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "netrw",
        once = false,
        callback = function(ev)
            if vim.api.nvim_win_is_valid(win)
                and vim.api.nvim_get_current_win() == win then

                apply_maps(ev.buf, "editor")
            end
        end,
    })
end

-- Floating navigator mode (files open in main window)
function M.float_navigator()
    local win = create_float_window()
    vim.cmd("edit .")

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "netrw",
        once = false,
        callback = function(ev)
            if vim.api.nvim_win_is_valid(win)
                and vim.api.nvim_get_current_win() == win then

                apply_maps(ev.buf, "navigator")
            end
        end,
    })
end

return M

