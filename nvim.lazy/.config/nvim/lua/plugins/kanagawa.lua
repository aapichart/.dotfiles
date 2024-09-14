return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 999,
	config = function()
		require("kanagawa").setup({
			options = {
				transparent = true,
			},
		})
		vim.cmd("colorscheme kanagawa")
	end,
}
