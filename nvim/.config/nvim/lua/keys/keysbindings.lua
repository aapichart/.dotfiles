vim.g.mapleader = ' '

local options = {noremap = true, silent = false}
local map = vim.api.nvim_set_keymap
local function mapn(key1, realkey)
    map('n', key1, realkey, options)
end

local function mapv(key1, realkey)
    map('v', key1, realkey, options)
end

local function mapi(key1, realkey)
    map('i', key1, realkey, options)
end

mapn('<C-h>','<C-w>h')
mapn('<C-l>','<C-w>l')
mapn('<C-j>','<C-w>j')
mapn('<C-k>','<C-w>k')

mapi('jk','<ESC>')
mapi('kj','<ESC>')

mapn('<leader>e',':NvimTreeToggle<cr>')
mapv('<','<gv')
mapv('>','>gv')

-- Nerdcomment
vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDSpaceDelims = 1
mapn('<leader>ci',"<cmd>call NERDCommenter#comment()<cr>")
mapv('<leader>ci',"<cmd>call NERDCommenter#comment()<cr>")

-- wincmd
mapn('<leader>h',':wincmd h<Cr>')
mapn('<leader>j',':wincmd j<Cr>')
mapn('<leader>k',':wincmd k<Cr>')
mapn('<leader>l',':wincmd l<Cr>')

-- Telescope
mapn('<leader>pp',"<cmd>lua require('telescope.builtin').builtin()<CR>")
mapn('<leader>m',"<cmd>lua require('telescope.builtin').oldfiles()<CR>")
mapn('<leader>b',"<cmd>lua require('telescope.builtin').buffers()<CR>")
mapn('<leader>/',"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")
mapn("<leader>'","<cmd>lua require('telescope.builtin').marks()<CR>")
mapn('<leader>f',"<cmd>lua require('telescope.builtin').git_files()<CR>")
mapn('<leader>bfs',"<cmd>lua require('telescope.builtin').find_files()<CR>")
mapn('<leader>rg',"<cmd>lua require('telescope.builtin').live_grep()<CR>")
mapn('<leader>cs',"<cmd>lua require('telescope.builtin').colorscheme()<CR>")

-- Lsp key gindings
mapn('<leader>gd',"<cmd>lua vim.lsp.buf.definition()<CR>")
mapn('<leader>gD',"<cmd>lua vim.lsp.buf.declaration()<CR>")
mapn('<leader><C-]>',"<cmd>lua vim.lsp.buf.definition()<CR>")
mapn('<leader>gr',"<cmd>lua vim.lsp.buf.references()<CR>")
mapn('<leader>gi',"<cmd>lua vim.lsp.buf.implementation()<CR>")
mapn('<leader>K',"<cmd>Lspsaga hower_doc<CR>")
mapn('<leader><C-k>',"<cmd>lua vim.lsp.buf.signature_help()<CR>")
mapn('<leader><C-p>',"<cmd>Lspsaga diagnostic_jump_prev<CR>")
mapn('<leader><C-n>',"<cmd>Lspsaga diagnostic_jump_next<CR>")
mapn('<leader>gf',"<cmd>lua vim.lsp.buf.formatting()<CR>")
mapn('<leader>gn',"<cmd>lua vim.lsp.buf.rename()<CR>")
mapn('<leader>ga',"<cmd>Lspsaga code_action<CR>")
mapv('<leader>ga',"<cmd>Lspsaga range_code_action<CR>")
mapn('<leader>gs',"<cmd>Lspsaga signature_help<CR>")

-- ultisnips
vim.g.UltiSnipsJumpForwardTrigger="<C-b>"
vim.g.UltiSnipsJumpBackwardTrigger="<C-z>"
