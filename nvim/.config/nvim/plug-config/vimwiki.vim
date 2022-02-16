set linebreak
set nocompatible

if has("autocmd")
	filetype plugin indent on
endif

let g:vimwiki_table_mappings=0 " so I can tab complete"
let g:vimwiki_list = [{'path':'~/works/vimwiki', 'path_html':'~/works/knowledgeNote'}]
"let g:vimwiki_list = [{'path':'~/works/vimwiki', 'syntax':'markdown', 'ext':'.md'}]
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown':'markdown', '.mdown':'markdown'}

" Makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext =1

let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1

