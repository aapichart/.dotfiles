return {
  "williamboman/mason.nvim",
  cmd = "Mason",
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
