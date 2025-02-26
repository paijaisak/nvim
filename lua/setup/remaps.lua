
-- remaps.lua

vim.g.mapleader = " "

-- pv file explore
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- space+space+x sources this file
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")

-- space+x runs this line
vim.keymap.set("n", "<leader>x", "<cmd>:.lua<CR>")

-- in visual mode, space+x runs these lines
vim.keymap.set("n", "<leader>x", "<cmd>:lua<CR>")

