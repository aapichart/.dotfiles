return {
  "williamboman/mason.nvim",
  lazy = false,
  cmd = {"Mason", "MasonInstall","MasonUpdate"},
  event = "BufReadPre",
  option = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      },
    },
  },
}

