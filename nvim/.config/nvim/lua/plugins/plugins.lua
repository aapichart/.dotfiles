-- Bootstrap for packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- If you are using Packer
  -- use 'shaunsingh/nord.nvim'
  -- use gruvbox theme
  use 'sainnhe/gruvbox-material'

  use 'jpalardy/vim-slime'
  use 'airblade/vim-gitgutter'
  use 'vimwiki/vimwiki'
  use 'tbabej/taskwiki'
  use 'tpope/vim-surround'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'itchyny/lightline.vim'
  use 'preservim/nerdcommenter'

  -- treesitter for syntax highlighting and some other plugins for treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}  
  use {'windwp/nvim-ts-autotag'}
  use {'p00f/nvim-ts-rainbow'}
  use {'windwp/nvim-autopairs'}
  -- config lualine (status line)
  --use {
    --'hoob3rt/lualine.nvim',
    --requires = {'kyazdani42/nvim-web-devicons', opt = true}
  --}
  -- config bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  -- config nvim-tree for file explorer
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  -- Use this plugin for helping us know which keys are mapping
  use {'folke/which-key.nvim'}
  -- Telescope is used like an extensible fuzzy finder
  --use {'nvim-lua/popup.nvim'}
  use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- Plugin for code completion and language servers
  --use 'prabirshrestha/vim-lsp'
  --use 'mattn/vim-lsp-settings'
 
  -- Plugin for language server configuration
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Plugin for code completion 
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind-nvim'
  use 'glepnir/lspsaga.nvim'

--  use 'hrsh7th/cmp-vsnip'
--  use 'hrsh7th/vim-vsnip'
--  use {'kabouzeid/nvim-lspinstall'}

  -- Snips plugins
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'


  use 'voldikss/vim-floaterm'
  use 'ptzz/lf.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)


