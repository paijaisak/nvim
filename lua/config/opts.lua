-- opts.lua

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
	virtual_lines = true

	-- Alternatively, customize specific options
	-- virtual_lines = {
	--  -- Only show virtual line diagnostics for the current cursor line
	--  current_line = true,
	-- },

})
