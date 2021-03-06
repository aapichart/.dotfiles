-- Setting lsp-zero
local status_ok, lsp_zero = pcall(require, "lsp-zero")
if not status_ok then
    return
end
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

-- Setting for lspconfig
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- Setting for nvim-lsp-installer
local status_ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end
local servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "html",
  "jsonls",
  "solc",
  "sumneko_lua",
  "tflint",
  "tsserver",
  "pyright",
}

local settings = {
	ensure_installed = servers,
	ui = {
		icons = {},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
		},
	},
	log_level = vim.log.levels.INFO,
}

nvim_lsp_installer.setup(settings)

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
	on_attach = require("chartasa.lsp.handlers").on_attach,
	capabilities = require("chartasa.lsp.handlers").capabilities,
  }

  if server == "jsonls" then
    local jsonls_opts = require"chartasa.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "sumneko_lua" then
    local sumneko_opts = require "chartasa.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "chartasa.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "solang" then
    local solang_opts = require "chartasa.lsp.settings.solang"
    opts = vim.tbl_deep_extend("force", solang_opts, opts)
  end

  if server == "solc" then
    local solc_opts = require"chartasa.lsp.settings.solc"
    opts = vim.tbl_deep_extend("force", solc_opts, opts)
  end

  if server == "emmet_ls" then
    local emmet_ls_opts = require"chartasa.lsp.settings.emmet_ls"
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  lspconfig[server].setup(opts)
end

