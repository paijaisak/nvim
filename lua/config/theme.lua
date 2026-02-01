-- theme.lua
-- Custom highlight overrides

-- Function to customize highlights after colorscheme is loaded
local function customize_highlights()
    -- Visual selection
    vim.api.nvim_set_hl(0, "Visual", {
        bg = "#3a4555",
        blend = 50,
    })

    -- Comments - gray
    vim.api.nvim_set_hl(0, "Comment", {
        fg = "#9d9d9d",
        italic = true,
    })

    -- Markdown quote blocks - same color as keyword directives
    vim.api.nvim_set_hl(0, "@markup.quote.markdown", { link = "Statement" })

    -- Markdown links - blue
    vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", { link = "Identifier" })
    vim.api.nvim_set_hl(0, "@lsp.type.class.markdown", { link = "Identifier" })
    vim.api.nvim_set_hl(0, "LibraryType", { link = "Identifier" })

    -- Obsidian plugin link colors - light blue
    vim.api.nvim_set_hl(0, "ObsidianRefText", { fg = "#3b9dd8" })
end

-- Apply highlights after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("CustomHighlights", { clear = true }),
    callback = customize_highlights,
})

-- Apply highlights when opening markdown files (for Obsidian plugin)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    group = vim.api.nvim_create_augroup("MarkdownHighlights", { clear = true }),
    callback = customize_highlights,
})

-- Apply highlights immediately
customize_highlights()

return {}
