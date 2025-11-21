local ops = require("config.netrw.file_ops")

local M = {}

-- Function to create a new file only inside netrw
function M.create_file() 
    local ctx = ops.save_context()

    -- Get new file name.  If empty, end.
    local filename = vim.fn.input("New file: ", "", "file")
    if filename == "" then
        return
    end
    
    local target = ops.cur_dir_entry()
    local path = target.dir .. "/" .. filename
    local exp_path = vim.fn.expand(path)
   
    -- Create file using touch from terminal
    -- vim.system is non-blocking for shell commands
    assert(path == exp_path, "Path differs from expanded path") 
    vim.system({ "touch", exp_path })
    ops.restore_context(ctx)
end

-- Function to create a new directory w/wo recursion
function M.create_directory()
    local ctx = ops.save_context()

    -- Get new directory name. If empty, end.
    local dirname = vim.fn.input("New directory: ")
    if dirname == "" then
        return
    end
    
    -- Get current directory to append new directory name
    local dir = vim.b.netrw_curdir
    local path = dir .. "/" .. dirname

    -- Make directory with recursion
    -- Same as mkdir -p ~/may/not/exist/until
    vim.fn.mkdir(path, "p")
    
    ops.restore_context(ctx)
end

-- Function to rename a file or directory 
function M.rename_entry()
    local ctx = ops.save_context()

    -- Get current Netrw directory and selected entry.
    local target = ops.cur_dir_entry()
    if not target then return end

    -- Capture the old path
    local old_path = target.dir .. "/" .. target.entry
    
    -- Get the new name of the directory or file
    -- if input is empty or is the same then end
    local newname = vim.fn.input("Rename to: ")
    if newname == "" or newname == target.entry then return end

    -- Set new path
    local new_path = target.dir .. "/" .. newname

    -- Execute rename
    vim.fn.rename(old_path, new_path)
    
    ops.restore_context(ctx)
end

-- Function to delete directory or file
function M.delete_entry()
    local ctx = ops.save_context()
    
    -- Get current Netrw directory and selected entry
    local target = ops.cur_dir_entry()
    if not target then return end

    -- Confirm deletion.  May make this optional with .setup()
    -- default is No
    local confirm = vim.fn.input("Delete " .. target.entry .. "? (y/N): ")
    if confirm:lower() ~= "y" then return end

    -- Delete entry: same as rm -rf /path/to/
    vim.fn.delete(target.dir .. "/" .. target.entry, "rf")

    ops.restore_context(ctx)
end

return M
