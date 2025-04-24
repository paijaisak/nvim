-- diagnostics.lua
-- Enhanced configuration for diagnostics display and navigation

-- Set up better diagnostic display
vim.diagnostic.config({
	-- Use a floating window for diagnostics
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		-- Increase width for longer messages
		width = 80,
		-- Ensure the message has enough height
		max_height = 20,
	},

	-- Use virtual text for inline diagnostics
	virtual_text = {
		spacing = 4,
		prefix = "●", -- Use a simple dot as prefix
		format = function(diagnostic)
			-- Limit inline text to a certain length
			if diagnostic.message:len() > 50 then
				return diagnostic.message:sub(1, 47) .. "..."
			end
			return diagnostic.message
		end,
	},

	-- Show signs in the sign column
	signs = true,

	-- Update diagnostics in insert mode (set to false if distracting)
	update_in_insert = false,

	-- Sort diagnostics by severity
	severity_sort = true,
})

-- Set up mappings for better diagnostic navigation
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'open floating diagnostic' })
-- alt-k on mac
vim.keymap.set('n', 'ª', '<cmd>cprev<CR>', { desc = 'previous diagnostic' })
-- alt-j on mac
vim.keymap.set('n', '√', '<cmd>cnext<CR>', { desc = 'next diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'open quickfix list' })

-- Define signs with more informative icons for different diagnostic levels
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

