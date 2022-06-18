-- Install packer.nvim if not found.
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- startup and add configuration plugins
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'haishanh/night-owl.vim'

  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'romainl/vim-cool'
  use 'jiangmiao/auto-pairs'     

  use 'phaazon/hop.nvim'
  use 'unblevable/quick-scope'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use 'hoob3rt/lualine.nvim'

  use 'L3MON4D3/LuaSnip'

  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'

  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim', 
      'nvim-lua/popup.nvim', 
    }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'

  require'plugins.hop'
  require'plugins.quick-scope'
  require'plugins.nvim-tree'
  require'plugins.lualine'
  require'plugins.luasnip'
  require'plugins.lsp'
  require'plugins.cmp'
  require'plugins.treesitter'
  require'plugins.telescope'
  require'plugins.dap'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
