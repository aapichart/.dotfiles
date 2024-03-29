local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end
configs.setup({

	-- A List of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {"javascript","typescript","c","cpp","cmake","python","lua","vim","vimdoc"},

	-- Install parsers synchronously (only applied to 'ensure_installed')
	sync_install = false,
    

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have 'tree-sister' CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	--ignore_install = { "javascript" },

	-- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
	highlight = {
		-- 'false' will disable the whole extension
		enable = true,
        use_languagetree = true,
		-- Setting this to true will run `h: syntax` and tree-sister at the same time.
		-- Set this to true if you depend on 'syntax' being enabled (like for indentation)
		-- Using this option may slow down your editor, and you may see some duplicate highlights,
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

    -- Setup for nvim-ts-autotag
    autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { "html", "xml", "javascript", "javascriptreact", "typescript", "typescriptreact", 
                        "vue", "jsx", "tsx","xml", "handlebars", "php", "markdown"}
    },
    indent = { enable = true },
})
