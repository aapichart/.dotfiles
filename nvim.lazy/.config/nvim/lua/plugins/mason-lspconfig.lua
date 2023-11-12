local opts = {
	ensure_installed = {
		"efm",
		"lua_ls",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
