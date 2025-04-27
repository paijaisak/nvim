-- colorscheme.lua

return {
	-- {
	--     "folke/tokyonight.nvim",
	--     lazy = false,    -- make sure we load this during startup
	--     priority = 1000, -- make sure to load this before all the other start plugins
	--     config = function()
	--         -- Load the colorscheme
	--         vim.cmd([[colorscheme tokyonight-night]])
	--
	--         -- Optionally, customize the colorscheme
	--         require("tokyonight").setup({
	--             style = "storm", -- Choose: "storm", "moon", "night", "day"
	--             transparent = true,
	--             terminal_colors = true,
	--         })
	--     end,
	-- },
	--
	-- Uncomment ONE of these alternative colorschemes if you prefer them:

	-- {
	--     "catppuccin/nvim",
	--     name = "catppuccin",
	--     priority = 1000,
	--     lazy = false,
	--     config = function()
	--         require("catppuccin").setup({
	--             flavour = "mocha", -- Choose: latte, frappe, macchiato, mocha
	--         })
	--         vim.cmd.colorscheme "catppuccin"
	--     end,
	-- },

	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true, -- Set to true for transparent background
				theme = "wave", -- Choose "wave" (default), "dragon" (warmer), or "lotus" (lighter)
				background = {
					dark = "wave", -- Style for dark variant
					light = "lotus", -- Style for light variant
				},
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none", -- Makes line number background transparent
							}
						}
					}
				},
				overrides = function(colors)
					return {
						-- Makes floating windows like completion menu transparent
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Makes sign column transparent
						SignColumn = { bg = "none" },

						-- Makes line number column transparent
						LineNr = { bg = "none" },
					}
				end,
			})

			vim.cmd.colorscheme "kanagawa"

			-- Extra steps to ensure transparency works properly
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
			-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopeWindowBorder", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
		end,
	},

	-- Option: Nightfox with transparent background (uncomment to use instead of Kanagawa)
	-- {
	--     "EdenEast/nightfox.nvim",
	--     lazy = false,
	--     priority = 1000,
	--     config = function()
	--         require("nightfox").setup({
	--             options = {
	--                 transparent = true,        -- Enable transparent background
	--                 terminal_colors = true,    -- Set terminal colors
	--                 dim_inactive = false,      -- Non-current windows would be dimmed
	--                 styles = {                 -- Style settings
	--                     comments = "italic",
	--                     keywords = "bold",
	--                     types = "italic,bold",
	--                 },
	--             },
	--             groups = {
	--                 all = {
	--                     -- Additional highlight group overrides
	--                     NormalFloat = { bg = "NONE" },
	--                     FloatBorder = { bg = "NONE" },
	--                     FloatTitle = { bg = "NONE" },
	--                     SignColumn = { bg = "NONE" },
	--                     LineNr = { bg = "NONE" },
	--                 }
	--             }
	--         })
	--         vim.cmd.colorscheme "nightfox" -- Try: nightfox, duskfox, nordfox, carbonfox, terafox
	--
	--         -- Extra steps to ensure transparency works properly
	--         vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
	--         vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
	--     end,
	-- },
}
