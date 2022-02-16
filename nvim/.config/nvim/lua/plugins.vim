" >> load plugins

"auto-install vim-plug
if empty(glob('"${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim'))
    silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin(stdpath('data') . 'vimplug')
    " Auto pairs for '(' '[' '{'
"    Plug 'jiangmiao/auto-pairs'
    " Sending text as a command to another tmux window

    Plug 'jpalardy/vim-slime'

    Plug 'justinmk/vim-sneak'    
    Plug 'airblade/vim-gitgutter'
    " Vimwiki - all related Plugins
    Plug 'vimwiki/vimwiki'
    Plug 'tbabej/taskwiki'
    Plug 'plasticboy/vim-markdown'

    Plug 'tpope/vim-surround'

    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'

    Plug 'tomtom/tcomment_vim'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|    PlugInstall --sync | q
    \| endif

