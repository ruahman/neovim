-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- map("n", "<Leader>h", ":set hlsearch!<CR>")
vim.keymap.set("n", "<Leader><Leader>", ":noh<CR>")
-- map("n", "<Leader>l", ":set list!<CR>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- resize windows
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")

-- move line
vim.keymap.set("n", "<S-j>", ":move .+1<CR>")
vim.keymap.set("n", "<S-k>", ":move .-2<CR>")

-- move selection
vim.keymap.set("v", "<S-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-k>", ":move '<-2<CR>gv=gv")

-- cd
vim.keymap.set("n", "cd", ":cd %:p:h<CR>")

-- toggle spell
vim.keymap.set("n", "<leader>st", ":set spell!<CR>")
