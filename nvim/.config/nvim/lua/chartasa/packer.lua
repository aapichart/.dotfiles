
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

-- This file can be loaded by calling 'lua require('plugins')' from your init.vim
-- Only required if you have packer configured as 'opt'
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	--
	use 'wbthomason/packer.nvim'
    -- Telescope is used like an extensible fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or 			       , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use { 'nvim-lua/popup.nvim' }
    --  use {'tom-anders/telescope-vim-bookmarks.nvim'}
    --  use {'nvim-telescope/telescope-media-files.nvim' }
    --  use {'nvim-telescope/telescope-ui-select.nvim' }
    --  use {'nvim-telescope/telescope-file-browser.nvim' }
    use {'sharkdp/fd'}
    use ({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use 'jpalardy/vim-slime'
    use 'airblade/vim-gitgutter'
    use 'vimwiki/vimwiki'
    use 'tbabej/taskwiki'
    use 'tpope/vim-surround'
    use 'tpope/vim-eunuch'
    use 'lewis6991/gitsigns.nvim'
    use 'itchyny/lightline.vim'
    use 'preservim/nerdcommenter'

    -- config for nvim markdown preview
    use { 'iamcco/markdown-preview.nvim', run=function ()
        vim.fn["mkdp#util#install"]()
    end }
    -- config bufferline
    -- use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
    -- config nvim-tree for file explorer
    --use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  
    -- Use this plugin for helping us know which keys are mapping
    use {'folke/which-key.nvim'}


    use {'windwp/nvim-ts-autotag'}
    use {'p00f/nvim-ts-rainbow'}

    -- treesitter for syntax highlighting and some other plugins for treesitter
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use ('nvim-treesitter/playground')
	use ('theprimeagen/harpoon')
	use ('mbbill/undotree')
    -- vim-fugitive for git helper
    use ('tpope/vim-fugitive')
    -- lf for file explorer
    use 'ptzz/lf.vim'
    use 'voldikss/vim-floaterm'
    use { 'akinsho/toggleterm.nvim' }
	
	-- for Lsp section
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
    
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup{} 
        end
    }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)




