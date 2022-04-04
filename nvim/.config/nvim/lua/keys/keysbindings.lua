vim.g.mapleader = ' '

local options = {noremap = true, silent = true}
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
mapn('<space>e',"<cmd>lua vim.diagnostic.open_float()<CR>")
mapn('[d',"<cmd>lua vim.diagnostic.goto_prev()<CR>")
mapn(']d',"<cmd>lua vim.diagnostic.goto_next()<CR>")
mapn('<space>q',"<cmd>lua vim.diagnostic.setloclist()<CR>")

local nvim_lsp = require('lspconfig')
local servers = { 'tsserver', 'pyright'}

local on_attach = function(client, bufnr)
    -- Do things when language server attaches to the current buffer
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    
    -- our first remap
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', options)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', options)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folder()))<CR>', options)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', options)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', options)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', options)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', options)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', options)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', options)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', options)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', options)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup{
        on_attach = on_attach
    }
end

mapn('<leader>ga',"<cmd>Lspsaga code_action<CR>")
mapv('<leader>ga',"<cmd>Lspsaga range_code_action<CR>")
mapn('<leader>gs',"<cmd>Lspsaga signature_help<CR>")

-- ultisnips
vim.g.UltiSnipsJumpForwardTrigger="<C-b>"
vim.g.UltiSnipsJumpBackwardTrigger="<C-z>"
