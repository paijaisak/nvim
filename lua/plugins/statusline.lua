return
{
	'maxmx03/roseline',
	opts = {},
	enabled = true,
	config = function()
		local function filepath() return vim.fn.expand('%:.') end

		local line = require('roseline')
		line.setup({
			theme = 'auto', -- Use auto theme since we'll override with hard-coded colors
			layout = {
				--	a = section_a,
				-- 	b = section_b,
				c = filepath,
				-- 	d = section_d,
				-- 	e = section_e,
			},
			icons = {
				vim = '󱐋',
				git = {
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
				-- default = { left = '', right = '' },
				default = { left = '█', right = '█' },
				block = { left = '█', right = '█' },
				round = { left = '█', right = '' },
			},
		})

		-- Use hard-coded rose-pine colors for the statusline

		-- Make direct force override of the colors for roseline
		vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
			pattern = "*",
			callback = function()
				-- Hard-code the specific colors from the rose-pine.lua theme file
				local rose_colors = {
					normal = '#9ccfd8', -- Cyan
					insert = '#ebbcba', -- Pink/Rose
					visual = '#c4a7e7', -- Purple/Iris
					replace = '#eb6f92', -- Red/Love
					command = '#f6c177', -- Yellow/Gold
				}

				-- Make StatusLine transparent
				vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#e0def4" })
				vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#908caa" })

				-- Set specific highlight groups for the statusline with transparency
				local group = "St"
				for mode, color in pairs(rose_colors) do
					local mode_cap = mode:sub(1, 1):upper() .. mode:sub(2)
					-- Set normal highlights - keep background transparent
					vim.api.nvim_set_hl(0, group .. mode_cap, { fg = color, bg = "NONE" })
					-- Set reverse highlights
					vim.api.nvim_set_hl(0, group .. mode_cap .. "Reverse",
						{ fg = color, bg = "NONE", reverse = true })
				end

				-- Extra highlight groups for git and diagnostics - all with transparent bg
				vim.api.nvim_set_hl(0, "StGitHead", { fg = "#f6c177", bg = "NONE" })
				vim.api.nvim_set_hl(0, "StGitAdded", { fg = "#9ccfd8", bg = "NONE" })
				vim.api.nvim_set_hl(0, "StGitChanged", { fg = "#ebbcba", bg = "NONE" })
				vim.api.nvim_set_hl(0, "StGitRemoved", { fg = "#eb6f92", bg = "NONE" })

				-- Diagnostic highlights
				vim.api.nvim_set_hl(0, "StDiagnosticError",
					{ fg = "#eb6f92", bg = "NONE", reverse = true })
				vim.api.nvim_set_hl(0, "StDiagnosticWarn",
					{ fg = "#f6c177", bg = "NONE", reverse = true })
				vim.api.nvim_set_hl(0, "StDiagnosticHint",
					{ fg = "#c4a7e7", bg = "NONE", reverse = true })
				vim.api.nvim_set_hl(0, "StDiagnosticInfo",
					{ fg = "#9ccfd8", bg = "NONE", reverse = true })

				vim.api.nvim_set_hl(0, "StDiagnosticErrorLspClient", { fg = "#eb6f92", bg = "NONE" })
				vim.api.nvim_set_hl(0, "StDiagnosticWarnLspClient", { fg = "#f6c177", bg = "NONE" })
				vim.api.nvim_set_hl(0, "StDiagnosticHintLspClient", { fg = "#c4a7e7", bg = "NONE" })
				vim.api.nvim_set_hl(0, "StDiagnosticInfoLspClient", { fg = "#9ccfd8", bg = "NONE" })

				-- Info highlights - all transparent backgrounds
				vim.api.nvim_set_hl(0, "StLsp", { fg = "#9ccfd8", bg = "NONE" })
				vim.api.nvim_set_hl(0, "StLspReverse", { fg = "#9ccfd8", bg = "NONE", reverse = true })
				vim.api.nvim_set_hl(0, "StInfo", { fg = "#9ccfd8", bg = "NONE" })
				vim.api.nvim_set_hl(0, "StInfoReverse", { fg = "#9ccfd8", bg = "NONE", reverse = true })

 
				vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeWindowBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeWindowBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeWindowBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeWindowBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeWindowBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeWindowBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeWindowBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeWindowBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeWindowBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })

			end,
		})

		-- Trigger the callback immediately with a delay
		vim.defer_fn(function()
			vim.cmd("doautocmd ColorScheme")
		end, 100)

		-- Apply again after a longer delay to ensure it overrides any late-loading themes
		vim.defer_fn(function()
			vim.cmd("doautocmd ColorScheme")
		end, 1000)
	end,
}

