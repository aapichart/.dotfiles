vim.cmd('filetype plugin indent on') 
vim.cmd('syntax on') 
vim.o.shortmess = vim.o.shortmess .. 'c' 
vim.o.hidden = true 
vim.o.whichwrap = 'b,s,<,>,[,],h,l' 
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 250 
vim.o.timeoutlen = 100
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 5
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true
vim.o.swapfile = false
vim.o.mouse = "a"
vim.wo.wrap = false
vim.wo.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.numberwidth = 4
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.opt.termguicolors = true
vim.cmd('colorscheme gruvbox-material')
vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
vim.cmd('highlight LineNr ctermbg=NONE guibg=NONE')
vim.cmd('highlight SignColumn ctermbg=NONE guibg=NONE') 
vim.cmd('highlight Folded ctermbg=NONE guibg=NONE') 
vim.cmd('highlight NonText ctermbg=NONE guibg=NONE')
vim.cmd('highlight SpecialKey ctermbg=NONE guibg=NONE')
vim.cmd('highlight VertSplit ctermbg=NONE guibg=NONE')
vim.cmd('highlight EndOfBuffer ctermbg=NONE guibg=NONE')
vim.cmd('highlight vimComment ctermbg=NONE guibg=NONE')
vim.cmd('highlight vimLineComment ctermbg=NONE guibg=NONE')
vim.cmd('highlight Comment ctermbg=NONE guibg=NONE')

