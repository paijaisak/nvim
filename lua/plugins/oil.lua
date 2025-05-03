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
		default_file_explorer = false,
		win_options = {
			-- Enable transparency in Oil windows
			winblend = 0, -- Set to a value like 10-30 for semi-transparency
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)
		
		-- Make Oil buffers transparent
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
			end,
		})
	end,
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false
}
