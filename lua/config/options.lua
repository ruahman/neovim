-- set to true if you have nerd font installed and selected in the terminal
vim.g.have_nerd_font = true

-- enable spell checking
vim.opt.spell = true

-- enable mouse mode
vim.opt.mouse = "a"

-- dont show the mode since it's already in the status line
vim.opt.showmode = false

-- save undo history, can still use undo after closing neovim
vim.opt.undofile = true

-- Case-insensitive searching unless one or more capital letter are in search term
vim.opt.ignorecase = true
vim.opt.smartcase = true -- case is back on if one or more capitals are in search term
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- shows matches as you type

-- sync clipboard between OS and Neovim
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.syntax = "on"
vim.opt.colorcolumn = "80"
vim.opt.wrap = false

-- configure how splits should open
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.number = true -- setup numbers on the left
vim.opt.relativenumber = true -- setup relative numbers

-- show which line you are on
vim.opt.cursorline = true

-- show which column you are on
vim.opt.cursorcolumn = true

-- signcolumn is on. stops the jitering when a sign is added or removed
vim.opt.signcolumn = "yes"

-- insert space for tab
vim.opt.tabstop = 2

-- insert space for indent
vim.opt.shiftwidth = 2

-- insert space when in insert
vim.opt.softtabstop = 2

-- expand tabs to space
vim.opt.expandtab = true

-- intelligent context aware indentation
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- file encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- so that perl provider does not show up on healthcheck
vim.g.loaded_perl_provider = 0

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- no swap files
vim.opt.swapfile = false
vim.opt.backup = false

-- autoread and autorwrite
vim.opt.autoread = true
vim.opt.autowrite = false

vim.cmd([[set nobackup nowritebackup noswapfile]])

-- highlight every time we yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	callback = function()
		vim.highlight.on_yank()
	end,
})
