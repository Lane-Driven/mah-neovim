-- Leader keys first 

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then 
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load settings, keymaps, etc. then plugins

require("settings")
require("keymaps")
require("lazy").setup("plugins") -- This is the directory they are in, for example "lua/plugins/treesitter.lua"
require("config")
require("lsp")
