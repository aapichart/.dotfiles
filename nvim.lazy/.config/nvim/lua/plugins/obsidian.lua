return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "work",
				path = "~/Works/obsidians/chartSpaceOO/work",
			},
			{
				name = "personal",
				path = "~/Works/obsidians/chartSpaceOO/personal",
			},
		},
	},
}
