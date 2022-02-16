" Setting global
source $HOME/.config/nvim/var/setvar.vim
" Install .vim  plugins
source $HOME/.config/nvim/lua/plugins.lua
" Setup key mapping for .vim plugins "
source $HOME/.config/nvim/keys/mappings.vim
" Setup .vim plugins config "
source $HOME/.config/nvim/plug-config/vimwiki.vim

lua << EOF
require('plugins')
-- require('options')
-- require('keysbinding')
-- require('treesitter-config')
-- decorate status line or (lualine)
-- "require('lualine-config')
-- "require('bufferline-config')
-- config nvim-tree for display file explorer
-- "require('nvim-tree-config')
-- "require('nvim-autopairs-config')
-- help show detail of mapping keys
-- "require('whichkey-config')
-- This is a good utilities like fzf
-- require('telescope-config')
--  Code Completion 
-- "require('lsp')
-- require('lspsaga-config')
-- vim.cmd('colorscheme nord')
EOF

" set colors theme
colorscheme gruvbox-material
set termguicolors
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight VertSplit ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
