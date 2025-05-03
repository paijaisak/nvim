-- theme.lua
-- Custom highlight overrides

-- Function to customize highlights after colorscheme is loaded
local function customize_highlights()
    -- Change Visual selection highlight (what appears when selecting text)
    -- Simulate transparency by using a semi-transparent color
    vim.api.nvim_set_hl(0, "Visual", {
        bg = "#3a4555", -- Base color - adjust this to your preferred color
        blend = 50,      -- Transparency level (0-100), higher is more opaque
    })

    -- You can also customize other visual modes if needed
    -- vim.api.nvim_set_hl(0, "VisualNOS", { bg = "#3a4555", blend = 30 })
end

-- Set up an autocmd to apply highlights after any colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("CustomHighlights", { clear = true }),
    callback = customize_highlights,
})

-- Apply highlights immediately in case colorscheme was already loaded
customize_highlights()

return {}
