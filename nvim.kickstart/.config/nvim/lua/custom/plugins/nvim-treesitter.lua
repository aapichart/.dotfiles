local config = function()
  local configs = require 'nvim-treesitter.configs'

  configs.setup {
    ensure_installed = {
      'tsx',
      'typescript',
      'javascript',
      'html',
      'css',
      'json',
    },
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
  }

  require('nvim-ts-autotag').setup {
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = true,
    },
    per_filetype = {
      ['html'] = { enable_close = true },
      ['typescriptreact'] = { enable_close = true, enable_rename = true, enable_close_on_slash = true },
      ['javascriptreact'] = { enable_close = true, enable_rename = true, enable_close_on_slash = true },
    },
    ensure_installed = {
      'markdown',
      'markdown_inline',
      'r',
      'regex',
      'julials',
      'vim',
      'json',
      'javascript',
      'typescript',
      'yaml',
      'html',
      'css',
      'bash',
      'lua',
      'dockerfile',
      'solidity',
      'gitignore',
      'python',
      'vue',
      'sql',
      'tsx',
      'jsx',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn',
        node_incremental = 'grn',
        scope_incremental = 'grc',
        node_decremental = 'grm',
      },
    },
  }
end

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  config = config,
}
