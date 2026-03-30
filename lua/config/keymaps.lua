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
-- vim.keymap.set("n", "<leader>st", ":set spell!<CR>")

vim.keymap.set("n", "<leader>y", function()
	local file = vim.fn.expand("%")
	local line = vim.fn.line(".")
	local ref = string.format("@%s:%d-%d", file, line, line)
	vim.fn.setreg("+", ref)
	vim.notify("Copied: " .. ref, vim.log.levels.INFO)
end, { desc = "Copy file:line ref for Claude Code" })

vim.keymap.set("v", "<leader>y", function()
	local file = vim.fn.expand("%")
	local line_start = vim.fn.line("v")
	local line_end = vim.fn.line(".")
	-- Ensure start <= end
	if line_start > line_end then
		line_start, line_end = line_end, line_start
	end
	local ref = string.format("@%s:%d-%d", file, line_start, line_end)
	vim.fn.setreg("+", ref)
	vim.notify("Copied: " .. ref, vim.log.levels.INFO)
end, { desc = "Copy file:line range ref for Claude Code" })
