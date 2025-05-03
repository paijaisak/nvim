return
{
	'maxmx03/roseline',
	opts = {},
	enabled = true,
	config = function()
		local function filepath() return '  ' .. vim.fn.expand('%:.') .. '  ' end

		local line = require('roseline')
		line.setup({
			theme = 'auto', -- Use auto theme since we'll override with hard-coded colors

			layout = {
				--	a = section_a,
				-- 	b = section_b,
				c = filepath,
				-- 	d = section_d,
				--	e = section_e
			},

			icons = {
				vim = ' 󱐋 ',
				git = {
					head = ' 󰄛',
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
				-- Removed box characters to just show the icons
				default = { left = '', right = '' },
				block = { left = '', right = '' },
				round = { left = '', right = '' },
			},
		})

		-- Use hard-coded colors for the statusline

		-- Make direct force override of the colors for roseline
		vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
			pattern = "*",
			callback = function()
				-- Hard-code the specific colors from the rose-pine.lua theme file
				local rose_colors = {
					normal = '#eb8792', -- Cyan
					insert = '#c4a7e7', -- Pink/Rose
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
					-- Set non-reverse highlights for icons
					vim.api.nvim_set_hl(0, group .. mode_cap .. "Reverse",
						{ fg = color, bg = "NONE", reverse = false })
				end

				-- Extra highlight groups for git and diagnostics - all with transparent bg
				vim.api.nvim_set_hl(0, "StGitHead", { fg = "#9ccfd8", bg = "NONE" })
				vim.api.nvim_set_hl(0, "StGitAdded", { fg = "#9ccfd8", bg = "NONE" })
				vim.api.nvim_set_hl(0, "StGitChanged", { fg = "#ebbcba", bg = "NONE" })
				vim.api.nvim_set_hl(0, "StGitRemoved", { fg = "#eb6f92", bg = "NONE" })

				-- Diagnostic highlights - using consistent colors for icons and text
				local error_color = "#eb6f92" -- Red/Love
				local warn_color = "#f6c177" -- Yellow/Gold
				local hint_color = "#c4a7e7" -- Purple/Iris
				local info_color = "#c4a7e7"

				-- For the diagnostic elements - ensuring all parts match
				vim.api.nvim_set_hl(0, "DiagnosticError", { fg = error_color, bg = "NONE" })
				vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = warn_color, bg = "NONE" })
				vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = hint_color, bg = "NONE" })
				vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = info_color, bg = "NONE" })

				-- For the icon in the statusline (non-reverse style)
				vim.api.nvim_set_hl(0, "StDiagnosticError",
					{ fg = error_color, bg = "NONE", reverse = false })
				vim.api.nvim_set_hl(0, "StDiagnosticWarn",
					{ fg = warn_color, bg = "NONE", reverse = false })
				vim.api.nvim_set_hl(0, "StDiagnosticHint",
					{ fg = hint_color, bg = "NONE", reverse = false })
				vim.api.nvim_set_hl(0, "StDiagnosticInfo",
					{ fg = info_color, bg = "NONE", reverse = false })

				-- For the LSP client name - match the colors with the icons
				vim.api.nvim_set_hl(0, "StDiagnosticErrorLspClient", { fg = error_color, bg = "NONE" })
				vim.api.nvim_set_hl(0, "StDiagnosticWarnLspClient", { fg = warn_color, bg = "NONE" })
				vim.api.nvim_set_hl(0, "StDiagnosticHintLspClient", { fg = hint_color, bg = "NONE" })
				vim.api.nvim_set_hl(0, "StDiagnosticInfoLspClient", { fg = info_color, bg = "NONE" })

				-- Info highlights - all transparent backgrounds
				vim.api.nvim_set_hl(0, "StLsp", { fg = info_color, bg = "NONE" })
				vim.api.nvim_set_hl(0, "StLspReverse", { fg = info_color, bg = "NONE", reverse = false })
				vim.api.nvim_set_hl(0, "StInfo", { fg = info_color, bg = "NONE" })
				vim.api.nvim_set_hl(0, "StInfoReverse", { fg = info_color, bg = "NONE", reverse = false })

				-- Additional diagnostic related highlights to ensure consistency
				vim.api.nvim_set_hl(0, "Diagnostic", { fg = info_color, bg = "NONE" })

				-- Border groups for diagnostics
				vim.api.nvim_set_hl(0, "DiagnosticError", { fg = error_color, bg = "NONE" })
				vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = warn_color, bg = "NONE" })
				vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = hint_color, bg = "NONE" })
				vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = info_color, bg = "NONE" })

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

				-- Make Visual selection transparent with subtle highlighting
				vim.api.nvim_set_hl(0, "Visual", { bg = "#3d425c", blend = 30 })
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
