-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- no highlight
-- vim.keymap.set("n", "<Leader><Leader>", ":noh<CR>")

-- indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move cursor with Alt+hjkl while staying in insert mode
-- (normal/visual Alt+hjkl is mini.move; insert mode is free)
vim.keymap.set("i", "<M-h>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("i", "<M-j>", "<Down>", { desc = "Move cursor down" })
vim.keymap.set("i", "<M-k>", "<Up>", { desc = "Move cursor up" })
vim.keymap.set("i", "<M-l>", "<Right>", { desc = "Move cursor right" })

-- move between buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")

-- delete buffer
vim.keymap.set("n", "bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("v", "<C-h>", "<C-w>h")
vim.keymap.set("v", "<C-j>", "<C-w>j")
vim.keymap.set("v", "<C-k>", "<C-w>k")
vim.keymap.set("v", "<C-l>", "<C-w>l")

-- resize windows
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")

-- cd
vim.keymap.set("n", "cd", ":cd %:p:h<CR>")

-- keymaps for LSP
vim.keymap.set("n", "gh", vim.lsp.buf.hover)
vim.keymap.set("n", "ge", vim.diagnostic.open_float)
vim.keymap.set("n", "gH", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
