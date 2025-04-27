return
{
	'https://github.com/xiyaowong/transparent.nvim.git',
	enabled = true,
	lazy = false,
	config = function()
		require("transparent").setup({
			groups = { -- table: default groups
				'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
				'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
				'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
				'SignColumn', 'CursorLineNr', 'EndOfBuffer',
			},
			extra_groups = { -- table: additional groups that should be cleared
				-- Make filename and location transparent
				"MiniStatuslineFilename", "MiniStatuslineFileinfo",
				"MiniStatuslineDevinfo", "MiniStatuslineInactive",
				-- General statusline groups - but not the main statusline
				"StatusLineNC", "StatusLine"
			},
			exclude_groups = { -- table: groups you don't want to clear
				-- Keep only mode indicator solid
				"MiniStatuslineModeNormal",
				"MiniStatuslineModeInsert",
				"MiniStatuslineModeVisual",
				"MiniStatuslineModeReplace",
				"MiniStatuslineModeCommand"
			},
		})
	end
}

