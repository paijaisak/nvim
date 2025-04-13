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

		-- Create custom mapping clues
		local direct_clues = {}
        
		-- Add a clue for <Leader>pv mapping
		table.insert(direct_clues, { mode = 'n', keys = '<Leader>', postkeys = 'pv', desc = 'netrw' })

		-- Set up mini.clue
		require('mini.clue').setup({
			window = {
				delay = 100,  -- Make it appear quickly
				config = {
					width = 'auto',
					border = 'single',
				},
			},
			
			triggers = {
				-- Leader triggers
				{ mode = 'n', keys = '<Leader>' },
				{ mode = 'x', keys = '<Leader>' },

				-- Built-in completion
				{ mode = 'i', keys = '<C-x>' },

				-- Other keys
				{ mode = 'n', keys = 'g' },
				{ mode = 'n', keys = "'" },
				{ mode = 'n', keys = '`' },
				{ mode = 'n', keys = '"' },
				{ mode = 'n', keys = '<C-w>' },
				{ mode = 'n', keys = 'z' },
			},
			
			clues = {
				-- Add the <Leader>pv mapping directly
				direct_clues,
				
				-- Also include category headings
				{ mode = 'n', keys = '<Leader>p', desc = 'Files' },
				
				-- Add netrw mapping with explicit description
				{ mode = 'n', keys = '<Leader>pv', desc = 'netrw' },
			},
		})

		-- auto highlight word under cursor
		-- local highlight = require('mini.cursorword')
		-- highlight.setup()

		-- local indentscope = require('mini.indentscope')
		-- indentscope.setup()
	end
}