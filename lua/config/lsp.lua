-- lsp.lua

--[[
	grn -> rename
	gra -> code action
	grr -> references
	gri -> implementations
	gO -> symbols
	CTRL-s (insert mode) -> signature help
]]

local function setup_lsp()
	-- Setup Lua language server for Neovim configuration
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "lua",
		callback = function()
			-- Determine if we're in a Neovim config directory
			local file_path = vim.api.nvim_buf_get_name(0)
			local is_nvim_config = file_path:match("nvim/lua") ~= nil

			-- Common settings for all Lua files
			local lua_settings = {
				Lua = {
					completion = {
						callSnippet = "Replace"
					},
					telemetry = { enable = false },
					diagnostics = {
						-- Common globals for all Lua projects
						globals = {
							-- Testing frameworks
							'describe', 'it', 'before_each', 'after_each', 'teardown',
							'pending',
						},
						-- Disable some overly strict checks
						disable = {
							'different-requires',
							'missing-fields',
							'missing-parameter',
						},
					},
					workspace = {
						checkThirdParty = false,
					},
				}
			}

			-- Add Neovim-specific settings if in Neovim config
			if is_nvim_config then
				lua_settings.Lua.diagnostics.globals = vim.tbl_extend("force",
					lua_settings.Lua.diagnostics.globals,
					{ 'vim', 'tree', 'configs' }
				)
				-- Add Neovim runtime files to library path
				lua_settings.Lua.workspace.library = vim.api.nvim_get_runtime_file("", true)
			end

			-- Start the language server
			vim.lsp.start({
				name = "lua_ls",
				cmd = { "lua-language-server" },
				root_dir = vim.fs.dirname(vim.fs.find({ ".git", "init.lua", "main.lua" }, { upward = true })[1]),
				settings = lua_settings,
			})
		end,
	})

	-- Setup clangd language server using native LSP
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "c", "cpp", "objc", "objcpp" },
		callback = function()
			vim.lsp.start({
				name = "clangd",
				cmd = { "clangd", "--background-index", "--clang-tidy" },
				root_dir = vim.fs.dirname(vim.fs.find({ ".git", "compile_commands.json", "compile_flags.txt" }, { upward = true })[1]),
			})
		end,
	})

	-- Setup key mappings
	vim.api.nvim_create_autocmd('LspAttach', {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			local bufnr = args.buf

			-- Mappings
			local opts = { buffer = bufnr }
			vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
			vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol, opts)
			vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, opts)

			-- Add hover, definition, etc.
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
		end,
	})
end

-- Initialize LSP
setup_lsp()

