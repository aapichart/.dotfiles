-- Setting global
-- Install .vim  plugins
--source $HOME/.config/nvim/plug-config/plugins.lua
--source $HOME/.config/nvim/plug-config/plugins.vim
-- Setup .vim plugins config 
--source $HOME/.config/nvim/plug-config/vimwiki.vim

-- This is Config for lua plugins
-- This is the namespace package, 
-- which I collect them into chartasa directory
require('chartasa')
require('options')
require('keysbinding')
-- decorate status line or (lualine)
-- require('lualine-config')
-- config nvim-tree for display file explorer
-- require('nvim-tree-config')
-- require('nvim-autopairs-config')
-- help show detail of mapping keys
-- This is a good utilities like fzf
--  Code Completion 
-- require('lsp')
-- require('lspsaga-config')

-- Setup key mapping for .vim plugins 
-- source $HOME/.config/nvim/keys/mappings.vim

