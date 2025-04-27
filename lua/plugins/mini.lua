-- mini.lua

--[[
statusline
comments (gc)
autopairs
surround (sa, sd, sr)
animations
indentscope
]]

return
{
	'echasnovski/mini.nvim',
	enabled = true,
	config = function()
		-- icons for use with mini plugins
		local icons = require('mini.icons')
		icons.setup()

		-- statusline
		local statusline = require('mini.statusline')
		statusline.setup {
			use_icons = vim.g.have_nerd_font,
			-- Make statusline transparent
			content_background = 'none',
			-- Override sections directly in the setup config
			sections = {
				-- Custom location section
				location = function()
					return '%2l:%-2v'
				end,
				-- Custom filename section
				filename = function()
					if vim.bo.buftype == 'terminal' then
						return '%t'
					else
						return '%f%m%r'
					end
				end,
			}
		}

		-- Add selective transparency to statusline highlight groups
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				-- Make filename and location transparent
				vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = "NONE", ctermbg = "NONE" })
				vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { bg = "NONE", ctermbg = "NONE" })
				vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { bg = "NONE", ctermbg = "NONE" })
				vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { bg = "NONE", ctermbg = "NONE" })
				-- Keep mode indicators with their original background colors
				-- (MiniStatuslineModeNormal, etc. are left as-is)
			end,
		})

		-- comments ('gc' and 'gcc')
		local comment = require('mini.comment')
		comment.setup()

		-- easy autopairs
		local autopairs = require('mini.pairs')
		autopairs.setup()

		-- surround with sa, delete with sd, substitute with sr + motion
		local surround = require('mini.surround')
		surround.setup()

		-- add animations (smooth scrolling, cursor animations, window resize)
		local animations = require('mini.animate')
		animations.setup()

		-- Set up mini.clue with a simplified configuration
		-- Now that all LSP keybindings are global, mini.clue should detect them automatically
		local clue = require('mini.clue')
		clue.setup({
			window = {
				delay = 200,
				config = {
					width = 'auto',
					border = 'single',
				},
			},

			-- Enable showing existing key mappings
			show_existing = true,

			-- Use builtin_specs for standard key groups
			builtin_specs = {
				g = { desc = 'Go to...' },
				z = { desc = 'Folds, spelling, etc.' },
				['<Leader>'] = { desc = 'Leader mappings' },
				['<C-w>'] = { desc = 'Windows' },
			},

			triggers = {
				-- Show clues on these triggers
				{ mode = 'n', keys = 'g' },
				{ mode = 'n', keys = 'gr' }, -- Explicit trigger for gr
				{ mode = 'n', keys = 'z' },
				{ mode = 'n', keys = '<Leader>' },
				{ mode = 'n', keys = '<C-w>' },
				{ mode = 'i', keys = '<C-x>' },
			},

			clues = {
				-- Basic leader clues
				{ mode = 'n', keys = '<Leader>pv',       desc = 'netrw' },
				{ mode = 'n', keys = '<Leader>p',        desc = 'Files' },

				-- Show help when pressing leader twice
				{ mode = 'n', keys = '<Leader><Leader>', desc = 'Show help' },
			},
		})

		-- auto highlight word under cursor
		-- local highlight = require('mini.cursorword')
		-- highlight.setup()

		-- local indentscope = require('mini.indentscope')
		-- indentscope.setup()
	end
}
