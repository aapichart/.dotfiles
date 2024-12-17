return {
	require("lazy").setup({
		{
			"vhyrro/luarocks.nvim",
			priority = 1001, -- this plugin needs to run before anthing else
			opts = {
				rocks = { "magick" },
			},
			-- rocks = {
			-- 	hererocks = true, -- recommended if you do not have global installation of lua 5.1.
			-- },
		},
		{
			"3rd/image.nvim",
			dependencies = { "luarocks.nvim" },
			opts = {},
		},
	}),
	require("image").setup({
		backend = "kitty",
		processor = "magick_cli", -- or "magick_cli"
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				floating_windows = false, -- if true, images will be rendered in floaing markdown windows
				filetypes = { "markdown", "vimwiki" }, -- markdown extensions
			},
			neorg = {
				enabled = true,
				filetypes = { "norg" },
			},
			typst = {
				enabled = true,
				filetypes = { "typst" },
			},
			html = {
				enabled = false,
			},
			css = {
				enabled = false,
			},
		},
		background_transparent = true,
		max_width = nil,
		max_height = nil,
		max_width_window_percentage = nil,
		max_height_window_percentage = 50,
		window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
		window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
		tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
		hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
	}),
}
