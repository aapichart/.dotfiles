return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = {
    filters = {
      dotfiles = false,
    },
    renderer = {
      group_empty = true,
    },
    view = {
      width = 30,
    },
    sort_by = "case_sensitive",
  }
}
