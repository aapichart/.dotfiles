vim.g.nvim_tree_indent_markers = 1

require("nvim-tree").setup{
  auto_open = 1,
  auto_close =1,
  view = {
      width = 25
  },
  git = {
      enable = true,
      ignore = true,
  }
}

