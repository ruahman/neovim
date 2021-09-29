vim.g.colors_name = 'night-owl'
-- fixes pmenu ctermfg, not sure why this work
-- auto comand for VimEnter, when everything is setup,
-- run this command???
vim.cmd([[au VimEnter * highlight pmenu ctermfg=white]])
