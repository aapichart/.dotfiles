return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false, -- set this if you want to always pull the latest change
	opts = {
		-- add any opts here
		provider = "openai",
		openai = {
			-- endpoint = "https://api.openai.com/v1",
			model = "gpt-4o-mini",
			-- api_key = os.getenv("OPENAI_API_KEY"), -- Accessing the environment variable
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			cmd = { "RenderMarkdown" },
			dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
			lazy = true,
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
			config = function()
				require("obsidian").get_client().opts.ui.enable = false
				vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_get_namespaces()["ObsideanUI"], 0, -1)
				require("render-markdown").setup({})
			end,
		},
	},
}
