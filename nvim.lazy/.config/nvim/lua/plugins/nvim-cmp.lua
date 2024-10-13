return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"f3fora/cmp-spell",
		"ray-x/cmp-treesitter",
		"kdheepak/cmp-latex-symbols",
		"David-Kunz/cmp-npm",
		"jc-doyle/cmp-pandoc-references",
		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "2.*", -- Replace <CurrentMajor> by the latest release major (first number of lastest release)
			-- install jsregexp (Optional!)
			build = "make install_jsregexp",
		},
		{
			"KadoBOT/cmp-plugins",
			config = function()
				require("cmp-plugins").setup({
					files = { "plugins.lua" },
				})
			end,
		},
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		lspkind.init()

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		-- for friendly snippets
		require("luasnip.loaders.from_vscode").lazy_load()
		-- for custom snippets
		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/snips" } })

		vim.opt.completeopt = "menu,menuone,noselect"

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggest
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggest
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestion
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			autocomplete = false,
			-- Source for autocompletion
			sources = cmp.config.sources({
				{ name = "otter" },
				{ name = "plugins" },
				{ name = "luasnip", keyword_length = 3, max_item_count = 3 },
				{ name = "pandoc_references" },
				{ name = "buffer", keyword_length = 5, max_item_count = 3 },
				{ name = "spell" },
				{ name = "treesitter", keyword_length = 5, max_item_count = 3 },
				{ name = "calc" },
				{ name = "latex_symbols" },
				{ name = "emoji" },
				{ name = "nvim_lsp" }, -- lsp
				{ name = "path" }, -- file system paths
				{ name = "buffer" },
				{ name = "nvim_lsp_signature_help" }, -- signature help
			}),
			-- configure lspkind for vs-code like icons
			formatting = {
				format = lspkind.cmp_format({
					with_text = true,
					maxwidth = 100,
					ellipsis_char = "...",
					menu = {
						otter = "[🦦]",
						luasnip = "[snip]",
						nvim_lsp = "[LSP]",
						buffer = "[buf]",
						path = "[path]",
						spell = "[spell]",
						pandoc_references = "[ref]",
						tags = "[tag]",
						treesitter = "[TS]",
						calc = "[calc]",
						latex_symbols = "[tex]",
						emoji = "[emoji]",
					},
				}),
			},
			view = {
				entries = "native",
			},
			window = {
				documentation = {
					border = require("misc.style").border,
				},
			},
		})
	end,
}
