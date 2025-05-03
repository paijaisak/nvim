return
{
	'nomis51/nvim-xcode-theme',
	enabled = true,
	priority = 1000,  -- Make sure it loads before other plugins
	config = function()
		-- This is a Vim-script colorscheme, not a Lua module
		vim.cmd.colorscheme "xcode"
	end,
}
