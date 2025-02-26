
-- config.lua

-- highlight on yanking
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'highlight on yanking',
	callback = function()
		vim.highlight.on_yank()
	end,
})

