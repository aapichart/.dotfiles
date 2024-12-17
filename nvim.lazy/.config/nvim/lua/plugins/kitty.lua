return {
	require("lazy").setup({
		{
			"3rd/image.nvim",
			opts = {},
		},
		{
			rocks = {
				hererocks = true, -- recommended if you do not have global installation of lua 5.1.
			},
		},
	}),
}
