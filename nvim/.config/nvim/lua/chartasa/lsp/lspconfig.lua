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
require'lspconfig/configs'.ls_emmet = {
  default_config = {
    cmd = { 'ls_emmet', '--stdio' };
    filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
      'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
    root_dir = function(_)
      return vim.loop.cwd()
    end;
    settings = {};
  };
}

-- Setting for nvim-lsp-installer
local status_ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end
local nvim_lsp_installer = require("nvim-lsp-installer")
nvim_lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require('chartasa.lsp.handlers').on_attach,
        capabilities = require('chartasa.lsp.handlers').capabilities,
    }
	if server.name == "sumneko_lua" then
		local sumneko_opts = require("chartasa.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end
	if server.name == "jsonls" then
		local jsonls_opts = require("chartasa.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end
    server:setup(opts)
end)


