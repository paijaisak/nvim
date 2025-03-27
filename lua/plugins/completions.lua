return
{
	"hrsh7th/nvim-cmp",
	enabled = true,
	-- load after first insert action
	event = "InsertEnter",

	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" }, -- pre-made snippets
		},

		"saadparwaiz1/cmp_luasnip", -- LuaSnip completions source
		
		-- Other useful sources
		"hrsh7th/cmp-nvim-lsp", -- LSP completions
		"hrsh7th/cmp-path", -- File system paths
		"hrsh7th/cmp-buffer", -- Current buffer words
		
		-- Optional: Icons in completion menu
		"onsails/lspkind.nvim",
	},

	config = function()
		local cmp = require('cmp')	
		local luasnip = require('luasnip')

		-- Load friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup(
			{
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert(
					{
						["<C-n>"] = cmp.mapping.select_next_item(), -- Next item
						["<C-p>"] = cmp.mapping.select_prev_item(), -- Prev item
						["<C-d>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(), -- Show completions
						["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
					}
				),

				sources = cmp.config.sources(
					{
						{ name = 'nvim_lsp' },
						{ name = 'luasnip' }, -- For luasnip users.
						{ name = 'buffer' },
						{ name = 'path' }
					}
				),

				formatting = {
					format = require('lspkind').cmp_format(
						{
							mode = 'symbol_text',
							maxwidth = 50,
							ellipsis_char = '...',
						}
					)
				}
			}
		)
	end
}
