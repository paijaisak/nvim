-- remaps.lua

-- pv file explore
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- space+space+x sources this file
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")

-- space+x runs this line
vim.keymap.set("n", "<leader>x", "<cmd>:.lua<CR>")

-- in visual mode, space+x runs these lines
vim.keymap.set("n", "<leader>x", "<cmd>:lua<CR>")

-- move command (thank you primeagen)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- J doesn't move the cursor with this remap, smarter J

-- ctrl up & down doesn't move the current line in view
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keeps search terms centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yanking and deleting to system clipboard more elegantly 
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>d", "\"+d")
vim.keymap.set("v", "<leader>d", "\"+d")

-- change every occurence of word i'm in (the primeagen)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod +x using leader+x (the primeagen)
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- remove search highlighting
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { silent = true })

