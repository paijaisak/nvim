
-- config.lua

-- has to be loaded before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- highlight on yanking
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'highlight on yanking',
	callback = function()
		vim.highlight.on_yank()
	end,
})

