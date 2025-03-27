
-- statusline
-- comments (gc)
-- autopairs
-- surround (sa, sd, sr)
-- animations
-- indentscope

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
			statusline.setup { use_icons = vim.g.have_nerd_font }
			
			-- override statusline format
			statusline.section_location = function()
				return '%2l:%-2v'
			end

			-- override statusline filepath
			statusline.section_filename = function()
				if vim.bo.buftype == 'terminal' then
					return '%t'
				else
					return '%f%m%r'
				end
			end

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

		-- auto highlight word under cursor
		-- local highlight = require('mini.cursorword')
		-- highlight.setup()
		
		local indentscope = require('mini.indentscope')
		indentscope.setup()

	end
}

