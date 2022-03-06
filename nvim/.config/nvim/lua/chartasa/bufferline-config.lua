vim.opt.termguicolors = true

require("bufferline").setup{
    options= {
        numbers = "buffer_id"
    }
}
vim.cmd[[
  nnoremap <silent><TAB> :BufferLineCycleNext<CR>
  nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
]]
