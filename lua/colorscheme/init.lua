local utils = require'utils'
local global = utils.global
local cmd = utils.cmd
local set = utils.set

global.colors_name = 'night-owl'

set.termguicolors = true

-- if vim.fn.has('termguicolors') == true
-- then
--   set.termguicolors = true
-- end

-- cmd[[au VimEnter * highlight pmenu ctermfg=white]]
