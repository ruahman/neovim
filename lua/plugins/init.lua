local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
  local use = use
     use 'wbthomason/packer.nvim'

     use 'nvim-treesitter/nvim-treesitter'
     use 'p00f/nvim-ts-rainbow'
     use 'sheerun/vim-polyglot'
     
     use 'tpope/vim-commentary'
     use 'haya14busa/vim-easymotion'    
     use 'tpope/vim-surround'
     use 'jiangmiao/auto-pairs'     
     
     use 'haishanh/night-owl.vim'
     
     use 'neovim/nvim-lspconfig'
     use 'nvim-lua/completion-nvim'
     use 'SirVer/ultisnips'

     use {
       'nvim-telescope/telescope.nvim',
       requires = {'nvim-lua/plenary.nvim'}
     }

     use 'itchyny/lightline.vim'
  end
)

require('plugins.treesitter')
require('plugins.completion')
require('plugins.lsp')
require('plugins.telescope')
require('plugins.lightline')
require('plugins.ultisnips')
