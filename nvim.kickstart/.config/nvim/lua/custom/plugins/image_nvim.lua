return {
	"3rd/image.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("nivm-treesitter.configs").setup({
					ensure_installed = { "markdown" },
					highlight = { enable = true },
				})
			end,
		},
	},
}
