return
{
	'maxmx03/roseline',
	opts = {},
	dependencies = {
		'rose-pine/neovim',
	},

	config = function()
		local function filepath() return vim.fn.expand('%:.') end

		local line = require('roseline')
		line.setup({
			theme = 'rose-pine',
			layout = {
				--	a = section_a,
				-- 	b = section_b,
				c = filepath,
				-- 	d = section_d,
				-- 	e = section_e,
			},
			icons = {
				-- vim = '',
				vim = '󱐋',
				git = {
					-- head = '',
					-- head = '',
					head = '󰄛',
					added = '',
					changed = '',
					removed = '',
				},
				diagnostic = {
					Error = '',
					Warning = '',
					Information = '',
					Question = '',
					Hint = '󰌶',
					Debug = '',
					Ok = '󰧱',
				},
				os = {
					Linux = '',
					microsoft = '',
					Darwin = '',
				},
				-- default = { left = '', right = '' },
				default = { left = '█', right = '█' },
				block = { left = '█', right = '█' },
				round = { left = '█', right = '' },
			},
		})
	end,
}
