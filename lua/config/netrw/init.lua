local keymaps = require("config.netrw.keymaps")

local actions = require("config.netrw.actions")
local ops = require("config.netrw.file_ops")
local ui = require("config.netrw.ui")

-- Open floating Netrw window for quick edit
vim.keymap.set("n", "<leader>ne", ui.float_editor, {
    desc = "Open Netrw for quick edit",
})
-- Open floating Netrw window for navigation
vim.keymap.set("n", "<leader>nf", ui.float_navigator, {
    desc = "Open Netrw for navigation",
})

-- Apply to Netrw
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        
        -- Apply keymaps
        keymaps.apply(bufnr)
        
    end,
})


