
-- opts.lua

vim.opt.relativenumber = true

-- if want thick cursor always: vim.opt.guicursor = ""

-- if want spaces for tabs, use vim.opt.expandtab = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.smartindent = true

-- line wrap
vim.opt.wrap = true        -- enable line wrapping
vim.opt.linebreak = true   -- wrap at word boundaries
vim.opt.breakindent = true -- indent wrapped lines
vim.opt.showbreak = "↪ "   -- visual indicator for wrapped lines

vim.opt.termguicolors = true -- 24-bit true color support 

vim.opt.scrolloff = 8 -- always show at least 8 lines over or below current line when possible

vim.opt.signcolumn = "auto:3" -- sign column dynamically adjusts its width based on number of signs

vim.opt.colorcolumn = "" -- 80 as a rule for code, 120 for markdown, empty = disabled

