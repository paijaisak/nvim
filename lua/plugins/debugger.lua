return
{
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"julianolf/nvim-dap-lldb"
	},

	config = function()
		vim.keymap.set('n', '<leader>dt', ':DapUiToggle<CR>')
		vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>')
		vim.keymap.set('n', '<leader>dc', ':DapContinue<CR>')
		-- reset
		vim.keymap.set('n', '<leader>dr', 'lua require(dapui).open({reset = true})<CR>')

		require('dapui').setup()
	end
}
