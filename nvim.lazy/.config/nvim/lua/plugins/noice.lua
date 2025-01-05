return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper
		"MunifTanjim/nui.nvim",
		-- Optional:
		-- "nvim-notify" is only needed, if you want to use the notify
		-- if not available, we use 'mini' as the fallback
		{
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					backgrount_colour = "#000000",
				})
				require("noice").setup({
					lsp = {
						-- override markdown rendering so that **cmp** and other plugin use **Treesitter**
						-- override = {
						-- 	["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						-- 	["vim.lsp.util.stylize_markdown"] = true,
						-- 	["cmp.entry.get_documentation"] = true, -- require hrsh7th/nvim-cmp
						-- },
					},
					presets = {
						bottom_search = true,
						command_palette = true,
						long_message_to_split = true,
						inc_rename = false,
						lsp_doc_border = false,
					},
					markdown = {
						hover = {
							["|(%S-)|"] = vim.cmd.help, -- vim help links
							["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
						},
						highlights = {
							["|%S-|"] = "@text.reference",
							["@%S+"] = "@parameter",
							["^%s*(Parameters:)"] = "@text.title",
							["^%s*(Return:)"] = "@text.title",
							["^%s*(See also:)"] = "@text.title",
							["{%S-}"] = "@parameter",
						},
					},
				})
			end,
		},
	},
}
