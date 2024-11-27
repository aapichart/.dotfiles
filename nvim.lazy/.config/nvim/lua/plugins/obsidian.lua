return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspace = {
			{
				name = "personal",
				path = "~/Works/opsidians/personal",
			},
			{
				name = "work",
				path = "~/Works/obsidians/work",
			},
			{
				name = "chartSpaceOO",
				path = "~/Works/obsidians/chartSpaceOO",
			},
		},
	},
}
