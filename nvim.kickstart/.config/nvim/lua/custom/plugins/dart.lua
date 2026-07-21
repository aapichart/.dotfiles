return {
  'dart-lang/dart-vim-plugin',
  ft = 'dart', -- Only load this plugin when opening a Dart file
  config = function()
    -- fix structural indentation for Flutter widget trees
    vim.g.dart_indent_style = 'standard'

    -- Optional: Automatically format code using 'dart format' on save
    -- (Note : If your LSP already does this, you can leave this false)
    vim.g.dart_format_on_save = 1

    -- Enable HTML-style syntax highlighting inside Dart strings (for web/templats)
    vim.g.dart_html_in_string = 1
  end,
}
