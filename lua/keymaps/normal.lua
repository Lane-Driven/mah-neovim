local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Enter command mode without Shift + ;
map("n", ";", ":", { noremap = true })

-- Quick save / quit
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit All" })

-- Better movement
map("n", "H", "^", { desc = "Start of line" }) -- This command respects indentation as '0' goes to col 0.
map("n", "L", "$", { desc = "End of Line" })

-- Window management
map("n", "<leader>sv", "<cmd>vsplit<CR>",  { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<CR>",  { desc = "Horizontal split" })
map("n", "<leader>sx", "<cmd>close<CR>",  { desc = "Close split" }) -- Or just <leader>q

-- Quick Netrw
--map("n", "<leader>nf", ":Ex<CR>", { desc = "Open netrw" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })

-- Telescope is likely to dwarf this with <leader>fb for navigating buffers.
-- Buffer navigation
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Scrolling improved
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Search centering
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- Diagnostics (builtin LSP)
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Return to Dashboard
map("n", "<leader>hd", vim.cmd.Dashboard, { desc = "Home Dashboard" })
-- Telescope / Fuzzy Findering
-- Found in lua/plugins/telescope.lua
