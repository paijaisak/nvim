-- opts.lua

vim.opt.cmdheight = 0
vim.opt.showmode = false

vim.api.nvim_create_autocmd('CmdlineEnter', {
	group = vim.api.nvim_create_augroup(
		'cmdheight_1_on_cmdlineenter',
		{ clear = true }
	),
	desc = 'Don\'t hide the status line when typing a command',
	command = ':set cmdheight=1',
})

vim.api.nvim_create_autocmd('CmdlineLeave', {
	group = vim.api.nvim_create_augroup(
		'cmdheight_0_on_cmdlineleave',
		{ clear = true }
	),
	desc = 'Hide cmdline when not typing a command',
	command = ':set cmdheight=0',
})

vim.api.nvim_create_autocmd('BufWritePost', {
	group = vim.api.nvim_create_augroup(
		'hide_message_after_write',
		{ clear = true }
	),
	desc = 'Get rid of message after writing a file',
	pattern = { '*' },
	command = 'redrawstatus',
})

-- show current line number as well as relative
vim.opt.relativenumber = true
vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} '

-- if want thick cursor always: vim.opt.guicursor = ""

-- if want spaces for tabs, use vim.opt.expandtab = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.smartindent = true

-- line wrap
vim.opt.wrap = true -- enable line wrapping
vim.opt.linebreak = true -- wrap at word boundaries
vim.opt.breakindent = true -- indent wrapped lines
vim.opt.showbreak = "↪ " -- visual indicator for wrapped lines

vim.opt.termguicolors = true -- 24-bit true color support

vim.opt.scrolloff = 5 -- always show at least 8 lines over or below current line when possible

vim.opt.signcolumn = "auto:3" -- sign column dynamically adjusts its width based on number of signs

vim.opt.colorcolumn = "" -- 80 as a rule for code, 120 for markdown, empty = disabled

vim.opt.fillchars = 'eob: ' -- remove annoying tildes

vim.diagnostic.config({
	virtual_lines = {
		-- Only show virtual line diagnostics for the current cursor line
		current_line = true,
	},
})
