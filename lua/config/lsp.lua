-- lsp.lua

--[[
	grn -> rename
	gra -> code action
	grr -> references
	gri -> implementations
	gO -> symbols
	CTRL-s (insert mode) -> signature help
]]

-- Create global LSP keybindings with descriptions
-- These will be set up immediately and be present even without LSP
vim.keymap.set("n", "grn", function()
	vim.lsp.buf.rename()
end, { desc = "Rename symbol" })
vim.keymap.set("n", "gra", function()
	vim.lsp.buf.code_action()
end, { desc = "Code action" })
vim.keymap.set("n", "grr", function()
	vim.lsp.buf.references()
end, { desc = "Find references" })
vim.keymap.set("n", "gri", function()
	vim.lsp.buf.implementation()
end, { desc = "Find implementations" })
vim.keymap.set("n", "gO", function()
	vim.lsp.buf.document_symbol()
end, { desc = "Document symbols" })
vim.keymap.set("i", "<C-s>", function()
	vim.lsp.buf.signature_help()
end, { desc = "Signature help" })

-- Add hover, definition, etc.
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover()
end, { desc = "Hover documentation" })
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "Go to definition" })
vim.keymap.set("n", "gD", function()
	vim.lsp.buf.declaration()
end, { desc = "Go to declaration" })
vim.keymap.set("n", "gt", function()
	vim.lsp.buf.type_definition()
end, { desc = "Go to type definition" })

-- Create a group for gr prefix (used by mini.clue)
vim.keymap.set("n", "gr", "<Nop>", { desc = "LSP References/Actions" })

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
						callSnippet = "Replace",
					},
					telemetry = { enable = false },
					diagnostics = {
						-- Common globals for all Lua projects
						globals = {
							-- Testing frameworks
							"describe",
							"it",
							"before_each",
							"after_each",
							"teardown",
							"pending",
						},
						-- Disable some overly strict checks
						disable = {
							"different-requires",
							"missing-fields",
							"missing-parameter",
						},
					},
					workspace = {
						checkThirdParty = false,
					},
				},
			}

			-- Add Neovim-specific settings if in Neovim config
			if is_nvim_config then
				lua_settings.Lua.diagnostics.globals =
					vim.tbl_extend("force", lua_settings.Lua.diagnostics.globals, { "vim", "tree", "configs" })
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
				root_dir = vim.fs.dirname(
					vim.fs.find({ ".git", "compile_commands.json", "compile_flags.txt" }, { upward = true })[1]
				),
			})
		end,
	})

	-- setup rust-analyzer LSP
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "rust" },
		callback = function()
			vim.lsp.start({
				name = "rust-analyzer",
				cmd = { "rust-analyzer" },
				root_dir = vim.fs.dirname(
					vim.fs.find({ ".git", "Cargo.toml", "rust-analyzer.toml" }, { upward = true })[1]
				),
			})
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "markdown",
		callback = function()
			vim.lsp.start({
				name = "marksman",
				cmd = { "marksman", "server" },
				root_dir = vim.fs.dirname(vim.fs.find({ ".git", ".marksman.toml" }, { upward = true })[1]),
			})
		end,
	})
end

-- Initialize LSP
setup_lsp()
