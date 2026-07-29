return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- Improve UI for device/command pickers
  },
  config = function()
    require('flutter-tools').setup {
      flutter_lookup_cmd = nil,
      run_args = {
        '-d',
        '192.168.56.1:5555',
        '--no-enable-impeller', -- Keeping this here to prevent the vboxsf shader crash!
        '--build-dir=/home/apichart/flutter_builds',
      },
      dev_log = {
        open_cmd = 'tabedit',
      },
      ui = {
        border = 'rouded',
        notification_style = 'message',
      },
      decorations = {
        statusline = {
          device = true,
          app_version = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = 'Comment',
        prefix = '// ',
        enabled = true,
      },
      lsp = {
        color_variables = true, -- Renders color hex codes visually in editor
        settings = {
          showTools = true,
          completeFunctionCalls = true,
        },
        -- Connects keymaps when the LSP attaches to a Dart file
        on_attach = function(client, bufnr)
          local opts = { silent = true, buffer = bufnr }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        end,
      },
    }
  end,
}
