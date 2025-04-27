-- oil.lua

--[[
	<C-p> -> toggles preview
	<C-l> -> opens root cwd
	~ -> changes this to cwd (cd)
	gs -> sort
	gx -> open in external (finder)
	g. -> toggle hidden files
]]

return
{
	'stevearc/oil.nvim',
	---@module 'oil'
	---@diagnostic disable-next-line: undefined-doc-name
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = false
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false
}
