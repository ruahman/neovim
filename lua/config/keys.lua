local map = require("utils").map

-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.timout = true
vim.o.timeoutlen = 2000

map("n", "<Leader>h", ":set hlsearch!<CR>")
-- map("n", "<Leader>l", ":set list!<CR>")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-Right>", ":vertical resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")

-- move line
map("n", "<S-j>", ":move .+1<CR>")
map("n", "<S-k>", ":move .-2<CR>")
map("v", "<S-k>", ":move '<-2<CR>gv=gv")
map("v", "<S-j>", ":move '>+1<CR>gv=gv")

-- cd
map("n", "cd", ":cd %:p:h<CR>")
