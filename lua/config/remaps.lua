-- remaps.lua

-- netrw file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'netrw' })

vim.keymap.set('n', '<leader>o', '<cmd>Oil --float .<CR>', { desc = 'open oil' })

-- space+x sources this file
vim.keymap.set("n", "<leader>x", "<cmd>so %<CR>")

-- empty, for clue.mini
vim.keymap.set('n', '<Leader>s', function() end, { desc = '[s]earch' })

-- transparency-toggle
vim.keymap.set('n', '<leader>t', ':TransparentToggle<CR>', { desc = 'toggle transparency' })

-- space+xx runs this line
-- vim.keymap.set("n", "<leader>xx", "<cmd>:.lua<CR>")

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

-- switch buffers
vim.keymap.set("n", "<leader>b", "<C-6>", { desc = 'next buffer' })

-- yanking, putting and deleting to system clipboard more elegantly
vim.keymap.set("n", "<leader>y", "\"+y", { desc = 'yank to system' })
vim.keymap.set("n", "<leader>d", "\"+d", { desc = 'delete to system' })
vim.keymap.set("n", "<leader>p", "\"+p")

-- change every occurence of word i'm in (the primeagen)
vim.keymap.set(
	"n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = 'change every occurence of word i\'m in' }
)

-- chmod +x using leader+x (the primeagen)
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- remove search highlighting
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { silent = true })
