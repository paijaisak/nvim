-- telescope.lua

return
{
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	-- plenary are lua functions, use telescope as ui selector, nerd icons
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-ui-select.nvim',
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }
	},

	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[s]earch [f]iles' })
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch [h]elp' })
		vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[s]earch [k]eymaps' })
		vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[s]earch [s]elect telescope' })
		vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[s]earch current [w]ord' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[s]earch by [g]rep' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[s]earch [d]iagnostics' })
		vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[s]earch [r]esume' })
		vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[s]earch recent files ("." for repeat)' })
		vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[s]earch open [b]uffers' })
		vim.keymap.set('n', '<leader>sn', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = '[s]earch [n]eovim files' })
	end
}
