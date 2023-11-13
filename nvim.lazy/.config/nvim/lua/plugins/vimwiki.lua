return {
  "vimwiki/vimwiki",
  lazy = false,
  config = function ()
    vim.g.do_filetype_lua = 1
    -- did_load_filetye 0 => disable filetype.vim
    --                  1 => disable both filetype.vim and filetype.lua
    -- vim.g.did_load_filetypes = 0
    vim.o.linebreak = true
    vim.o.compatible = false
    vim.g.vimwiki_table_mappings = 0 -- This make we can tab complete
    vim.g.vimwiki_list = {
      {
        path = '~/works/vimwiki',
        path_html = '~/works/knowledgeNote'
      }
    }
    vim.g.vimwiki_ext2syntax = {
            ['.md'] = 'markdown',
            ['.markdown'] = 'markdown',
            ['.mdown'] = 'markdown'
    }
    -- Makes vimwiki markdown links as [text](test)
    vim.g.vimwiki_markdown_link_ext = 1

    vim.g.taskwiki_markup_syntax = 'markdown'
    vim.g.markdown_folding = 1
  end
}
