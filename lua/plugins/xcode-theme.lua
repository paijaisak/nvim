return
{
	'nomis51/nvim-xcode-theme',
	enabled = true,
	priority = 1000, -- Make sure it loads before other plugins
	config = function()
		-- vim.cmd.colorscheme 'xcodewwdc' -- xcode, xcodehc, xcodedark, xcodedarkhc, xcodelight, xcodelighthc, xcodewwdc
		vim.cmd.colorscheme 'xcodedark' -- xcode, xcodehc, xcodedark, xcodedarkhc, xcodelight, xcodelighthc, xcodewwdc

		vim.g.xcode_green_comments = 0 -- [0, 1], doesn't work with wwdc
		vim.g.xcode_emph_types = 1	-- [0, 1] emphasise types, default is 1
		vim.g.xcode_emph_funcs = 1	-- [0, 1] emphasise functions, default is 0
		vim.g.xcode_emph_idents = 0	-- [0, 1] the opposite, default is 0
		vim.g.xcode_match_paren_style = 1	-- [0, 1] 0 is nvim default blue, 1 is xcode yellow
		vim.g.xcode_dim_punctuation = 1		-- [0, 1] default is 1
	end,
}
