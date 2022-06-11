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

  use {
    'hoob3rt/lualine.nvim',
    requires = 'nvim-lua/lsp-status.nvim'
  }

  use 'SirVer/ultisnips'

  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'hrsh7th/cmp-nvim-lsp'

  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'

  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- use 'mfussenegger/nvim-dap'
  -- use 'leoluz/nvim-dap-go'

  require'plugins.hop'
  require'plugins.quick-scope'
  require'plugins.nvim-tree'
  require'plugins.lualine'
  require'plugins.ultisnips'
  require'plugins.lsp'
  require'plugins.cmp'
  require'plugins.treesitter'
  require'plugins.telescope'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
