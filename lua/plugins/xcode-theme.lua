return
{
	'nomis51/nvim-xcode-theme',
	enabled = true,
	priority = 1000,  -- Make sure it loads before other plugins
	config = function()
		vim.cmd.colorscheme 'xcodewwdc' -- xcode, xcodehc, xcodedark, xcodedarkhc, xcodelight, xcodelighthc, xcodewwdc
	end,
}
