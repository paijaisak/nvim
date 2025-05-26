---@diagnostic disable: undefined-field

return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		vim.keymap.set("n", "<leader>dc", function()
			dap.continue()
			dapui.open()
		end, { desc = "debug: continue" })

		vim.keymap.set("n", "<leader>dt", function()
			dap.terminate()
			dapui.close()
		end, { desc = "debug: terminate" })

		-- vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>')
		vim.keymap.set("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end, { desc = "toggle breakpoint" })

		vim.keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("breakpoint condition: "))
		end, { desc = "toggle breakpoint w/ condition" })

		vim.keymap.set("n", "<leader>dl", function()
			dap.step_into()
		end, { desc = "step into" })

		vim.keymap.set("n", "<leader>dj", function()
			dap.step_over()
		end, { desc = "step over" })

		vim.keymap.set("n", "<leader>dh", function()
			dap.step_out()
		end, { desc = "step out" })

		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb" },
			automatic_setup = true,
			handlers = {},
		})

		-- Add C/C++ configurations
		dap.configurations.c = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
		dap.configurations.cpp = dap.configurations.c
		dap.configurations.rust = dap.configurations.c

		require("dapui").setup()
		require("nvim-dap-virtual-text").setup()

		-- Setup breakpoint signs
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "󱕦", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "DapStoppedLine", numhl = "" })
	end,
}
