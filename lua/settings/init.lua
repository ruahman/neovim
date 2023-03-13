vim.opt.syntax = 'on'
vim.opt.colorcolumn = '80'
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

-- insert space for tab
vim.opt.tabstop = 2
-- insert space for indent
vim.opt.shiftwidth = 2
-- insert space when in insert
vim.opt.softtabstop = 2
-- expand tabs to space
vim.opt.expandtab = true

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

-- so that perl provider does not show up on healthcheck
vim.g.loaded_perl_provider = 0

-- vim.api.nvim_create_autocmd({"InsertLeave"}, {
--   pattern = "*.lua",
--   callback = function(_)
--     vim.opt.relativenumber = true
--   end
-- })

-- vim.api.nvim_create_autocmd({"InsertEnter"}, {
--   pattern = "*.lua",
--   callback = function(_)
--     vim.opt.relativenumber = false
--   end
-- })

-- no swap file???
vim.cmd[[set nobackup nowritebackup noswapfile]]

-- for python
vim.cmd[[autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4]]
-- vim.cmd[[autocmd InsertEnter * :set relativenumber]]
-- vim.cmd[[autocmd InsertLeave * :set norelativenumber]]
