-- formatter.lua

-- Sets up code formatting for various languages
-- Uses clang-format for C/C++ files with .clang-format from project root

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Load the plugin before saving
	cmd = { "ConformInfo" }, -- Load when running the ConformInfo command
	keys = {
		{
			-- Optional: Add a keymap to manually format
			"<leader>f",
			function()
				-- Get the filetype
				local filetype = vim.bo.filetype

				-- For C/C++ files, check for .clang-format
				if filetype == "c" or filetype == "cpp" or
				    filetype == "h" or filetype == "hpp" then
					-- Find .clang-format by going up directories
					local format_found = false
					local current_file = vim.fn.expand("%:p")
					local current_dir = vim.fn.fnamemodify(current_file, ":h")
					local max_depth = 10
					local depth = 0

					while current_dir ~= "" and depth < max_depth do
						local format_path = current_dir .. "/.clang-format"
						if vim.fn.filereadable(format_path) == 1 then
							format_found = true
							break
						end

						-- Go up one directory
						local new_dir = vim.fn.fnamemodify(current_dir, ":h")
						if new_dir == current_dir then -- Stop if we hit the root
							break
						end
						current_dir = new_dir
						depth = depth + 1
					end

					if format_found then
						require("conform").format({ async = true, lsp_fallback = true })
					else
						vim.notify("No .clang-format found for this file.", vim.log.levels.WARN)
					end
				else
					-- For all other filetypes, format normally
					require("conform").format({ async = true, lsp_fallback = true })
				end
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		-- Define formatters
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			h = { "clang_format" },
			hpp = { "clang_format" },

			-- Add other languages you might want to format
			lua = { "stylua" },
			-- python = { "black" },
			-- javascript = { "prettier" },
		},

		-- We'll use manual formatting instead of automatic to avoid errors
		-- Set to false to disable automatic formatting on save
		format_on_save = false,

		-- Formatter options
		formatters = {
			clang_format = {
				-- Use the project's .clang-format file
				prepend_args = { "--style=file" },
				-- Check if system has clang-format installed
				condition = function(self, ctx)
					if vim.fn.executable("clang-format") == 0 then
						vim.notify("clang-format not found in PATH", vim.log.levels.WARN)
						return false
					end
					return true
				end,
			},
		},
	},
}
