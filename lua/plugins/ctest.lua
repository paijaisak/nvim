return
{
	"SGauvin/ctest-telescope.nvim",
	opts = {
		-- Path to the ctest executable
		ctest_path = "ctest",

		-- Extra arguments to pass to ctest
		-- For example, to add '-C Debug', you should set this variable to {"-C", "Debug"}
		extra_ctest_args = {},

		-- Folder where your compiled executables will be found
		build_folder = "builddir",

		-- Configuration you would pass to require("dap").configurations.cpp
		dap_config = {
			type = "cppdbg",
			request = "launch",
		},
	},

	vim.keymap.set("n", "<leader>d", function()
		local dap = require("dap")
		if dap.session() == nil and (vim.bo.filetype == "cpp" or vim.bo.filetype == "c") then
			-- Only call this on C++ and C files
			require("ctest-telescope").pick_test_and_debug()
		else
			dap.continue()
		end
	end, { desc = "Debug: Start/Continue" })
}
