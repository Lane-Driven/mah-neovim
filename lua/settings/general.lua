local o = vim.opt

-- General
o.number = true 		-- Show line numbers
o.relativenumber = true 	-- Relative line numbers
o.mouse = "a"      		-- Enable mouse support in all modes, resize panes 
o.clipboard = "unnamedplus"	-- Use system clipboard
o.scrolloff = 8			-- Keep from reaching absolute bottom before scrolling
o.sidescrolloff = 8 		-- Same just for sides
o.autoread = true		-- Auto-reload files if changed externally
o.confirm = true 		-- Confirm instead of error when closing
o.hidden = true			-- Keep buffers withouth having to save when switching
o.undofile = true		-- Creates an undo history file on disk, Lets you undo even after closing and reopinging the file.
o.signcolumn = "yes" 		-- Always the signcolumn (LSP errors, git signs), I'll come to learn this more than likely.
o.wrap = false 			-- Disable hard line wrapping by default.
o.textwidth = 120		-- Hard 120 column limit for text


-- Search
o.ignorecase = true     -- Case sensitive search unless...
o.smartcase = true      -- the pattern contains uppercase.
o.incsearch = true      -- Highlight search matches as you type /search
o.hlsearch = true       -- Highlight all matches after searching

