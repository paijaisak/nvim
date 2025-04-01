-- lsp.lua

--[[
	grn -> rename
	gra -> code action
	grr -> references
	gri -> implementations
	gO -> symbols
	CTRL-s (insert mode) -> signature help
]]

return
{
	'neovim/nvim-lspconfig',
	enabled = true,

	dependencies = {
		{
			'folke/lazydev.nvim',
			ft = 'lua',
			opts = {
				library = {
					-- Add nvim-treesitter to the library paths
					plugins = { "nvim-treesitter" },
					path = '${3rd}/luv/library',
					words = { 'vim%.uv' }
				},
			},
		},
	},

	config = function()
		-- lua
		require('lspconfig').lua_ls.setup(
			{
				settings = {
					Lua = {
						-- Add more globals to prevent errors
						diagnostics = {
							globals = { 
								'vim',
								-- Common globals that might be missing
								'describe', 'it', 'before_each', 'after_each', 'teardown',
								'pending', 'tree', 'configs',
							},
							-- Disable some overly strict checks
							disable = {
								'different-requires',
								'missing-fields',
								'missing-parameter',
							},
						},

						-- Allow library detection for plugins
						completion = {
							callSnippet = "Replace"
						},
						-- Better handling of nvim API and third-party plugins 

						workspace = { 
							checkThirdParty = false,  -- Skip annoying prompts
							library = vim.api.nvim_get_runtime_file("", true),
						},
						-- Improve type checking

						telemetry = { enable = false },
					},
				},
			}
		)

		-- clangd
		require('lspconfig').clangd.setup(
			{
				cmd = { "clangd", "--background-index", "--clang-tidy" },  -- Enable clang-tidy
				filetypes = { "c", "cpp", "objc", "objcpp" }
			}
		)
	end,
}

