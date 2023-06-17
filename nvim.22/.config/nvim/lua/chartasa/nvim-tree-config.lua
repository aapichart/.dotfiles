vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

require("nvim-tree").setup{
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  view = {
      width = 27,
      height = 30,
      hide_root_folder = false,
      side = "left",
      auto_resize = true,
  },
  git = {
      enable = true,
      ignore = true,
  }
}

