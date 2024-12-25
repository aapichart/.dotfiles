return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	lazy = false,
	cmd = { "Mason", "MasonInstall", "MasonUpdate" },
	event = "BufReadPre",
	option = {},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				-- "typescript-language-server",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				-- "lua-language-server",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
			},
		})
	end,
}
