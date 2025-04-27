-- diagnostics.lua
-- enhanced configuration for diagnostics display and navigation

--[[
	alt-j, alt-k -> jump to next/prev local diagnostic
	alt-J, alt-K -> jump to next/prev global diagnostic

	<leader>e -> floating diagnostic window

	<leader>g -> quickfix list (global)
	<leader>l -> location list
]]

-- Set up better diagnostic display
vim.diagnostic.config({
	-- Use a floating window for diagnostics
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		-- Increase width for longer messages
		width = 80,
		-- Ensure the message has enough height
		max_height = 20,
	},

	-- optionally, use virtual text for inline diagnostics
	-- virtual_text = {
	-- 	spacing = 2,
	-- 	prefix = "●", -- Use a simple dot as prefix
	-- 	format = function(diagnostic)
	-- 		-- Limit inline text to a certain length
	-- 		if diagnostic.message:len() > 50 then
	-- 			return diagnostic.message:sub(1, 47) .. "..."
	-- 		end
	-- 		return diagnostic.message
	-- 	end,
	-- },

	-- Show signs in the sign column
	signs = false,

	-- Update diagnostics in insert mode (set to false if distracting)
	update_in_insert = false,

	-- Sort diagnostics by severity
	severity_sort = true,
})

-- auto-populate location and quickfix list with diagnostics
vim.api.nvim_create_autocmd({ 'DiagnosticChanged' }, {
	desc = 'Populate location list with diagnostics without opening it',
	callback = function()
		vim.diagnostic.setqflist({ open = false })
		vim.diagnostic.setloclist({ open = false })
	end,
})

-- use location list instead of quickfix list -> setqflist < setloclist & cnext < lnext

-- Set up mappings for better diagnostic navigation
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = '[e]xplore diagnostic' })
vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, { desc = '[l]ocal diagnostics' })
vim.keymap.set('n', '<leader>g', vim.diagnostic.setqflist, { desc = '[g]lobal diagnostics' })

-- alt-j on mac
vim.keymap.set('n', '√', '<cmd>lnext<CR>', { desc = 'next diagnostic' })
-- alt-k on mac
vim.keymap.set('n', 'ª', '<cmd>lprev<CR>', { desc = 'previous diagnostic' })

-- alt-J on mac
vim.keymap.set('n', '¬', '<cmd>cnext<CR>', { desc = 'next global diagnostic' })
-- alt-K on mac
vim.keymap.set('n', 'º', '<cmd>cprev<CR>', { desc = 'previous global diagnostic' })

local signs = {
	[vim.diagnostic.severity.ERROR] = "󰅚 ",
	[vim.diagnostic.severity.WARN] = "󰀪 ",
	[vim.diagnostic.severity.HINT] = "󰌶 ",
	[vim.diagnostic.severity.INFO] = "ℹ "
}

vim.diagnostic.config({
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		width = 80,
		max_height = 20,
	},

	signs = {
		text = signs,
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
		}
	},

	update_in_insert = false,
	severity_sort = true,
})
