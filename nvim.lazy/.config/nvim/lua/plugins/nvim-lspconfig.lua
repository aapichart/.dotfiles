-- enable keybinds only for when lsp server available
local on_attach = require("utils.lsp").on_attach
local diagnostic_signs = require("utils.lsp").diagnostic_signs

local config = function()
	require("neoconf").setup({})

	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local lsp_flags = {
		allow_incremental_sync = true,
		debounce_text_change = 150,
	}

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		sign = true,
		underline = true,
		update_in_insert = false,
	})

	vim.lsp.handlers["textDocument/hover"] =
		vim.lsp.with(vim.lsp.handlers.hover, { border = require("misc.style").border })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = require("misc.style").border })

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	lspconfig.r_language_server.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = lsp_flags,
	})

	lspconfig.emmet_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = lsp_flags,
	})

	lspconfig.cssls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = lsp_flags,
	})

	local function strsplit(s, delimiter)
		local result = {}
		for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
			table.insert(result, match)
		end
		return result
	end

	local function get_quarto_resource_path()
		local f = assert(io.popen("quarto --paths", "r"))
		local s = assert(f:read("*a"))
		f:close()
		return strsplit(s, "\n")[2]
	end

	local lua_library_files = vim.api.nvim_get_runtime_file("", true)
	-- local resource_path = get_quarto_resource_path()
	-- table.insert(lua_library_files, resource_path .. "lua-types")
	local lua_plugin_paths = {}
	-- table.insert(lua_plugin_paths, resource_path .. "lua-plugin/plugin.lua")

	lspconfig.sumneko_lua.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = lsp_flags,
		setting = {
			lua = {
				completion = {
					callSnippet = "Replace",
				},
				runtime = {
					version = "LuaJIT",
					plugin = lua_plugin_paths[1],
				},
				diagnostic = {
					globals = {
						"vim",
						"quarto",
						"pandoc",
						"io",
						"string",
						"print",
						"require",
						"table",
					},
				},
				workspace = {
					library = lua_library_files,
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})

	lspconfig.pyright.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = lsp_flags,
		root_dir = function(fname)
			return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.tom", "requirements.txt")(fname)
				or util.path.dirname(fname)
		end,
		settings = {
			python = {},
		},
	})

	lspconfig.julias.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = lsp_flags,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
