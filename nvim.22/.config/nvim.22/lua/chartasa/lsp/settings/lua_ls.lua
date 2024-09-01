local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup{
  cmd = {"lua-language-server"},
  filetype = {"lua"},
  root_dir = lspconfig.util.root_pattern("Makefile",".git"),
}
