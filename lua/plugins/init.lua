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

     use 'tpope/vim-commentary'
     use 'tpope/vim-surround'
     use 'romainl/vim-cool'
     -- use 'jiangmiao/auto-pairs'     

     use 'phaazon/hop.nvim'
     use 'unblevable/quick-scope'
     
     use 'kyazdani42/nvim-web-devicons'
     use 'kyazdani42/nvim-tree.lua'
     use {
       'hoob3rt/lualine.nvim',
       requires = 'nvim-lua/lsp-status.nvim'
     }

     use 'haishanh/night-owl.vim'
     
     -- use 'sheerun/vim-polyglot'

     use 'nvim-treesitter/nvim-treesitter'
     use 'p00f/nvim-ts-rainbow'

     use 'neovim/nvim-lspconfig'
     use 'hrsh7th/cmp-nvim-lsp'
     use 'hrsh7th/cmp-buffer'
     use 'hrsh7th/nvim-cmp'
     use 'quangnguyen30192/cmp-nvim-ultisnips'
     use 'SirVer/ultisnips'

     use {
       'nvim-telescope/telescope.nvim',
       requires = 'nvim-lua/plenary.nvim'
     }

  end
)

require'plugins.treesitter'
require'plugins.telescope'
require'plugins.quick-scope'
require'plugins.hop'
require'plugins.nvim-tree'
require'plugins.lualine'
require'plugins.ultisnips'
require'plugins.cmp'
require'plugins.lsp'
