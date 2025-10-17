return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && npm install',
  keys = {},
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
  -- build = function()
  -- 	vim.fn["mkdp#util#install"]()
  -- end,
  requires = {
    'zhaozg/vim-diagram', -- Syntax plugin for Mermaid.js diagrams
    'aklt/plantuml-syntax', -- If you also use PlantUML
  },
}
