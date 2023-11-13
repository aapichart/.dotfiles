local mapkey = require("utils.keymapper").mapkey
-- local keymap = vim.keymap

local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	mapkey("<leader>fd", "Lspsaga finder", "n", opts) -- go to definition
	mapkey("<leader>gd", "Lspsaga peek_definition", "n", opts) -- peek definition
	mapkey("<leader>gD", "Lspsaga goto_definition", "n", opts) -- go to definition
	mapkey("<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
	mapkey("<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
	mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts) -- show diagnostics for line
	mapkey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
	mapkey("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostics in buffer
	mapkey("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostics in buffer
	mapkey("K", "Lspsaga hover_doc", "n", opts) -- show documentation for what is under cursor
	mapkey("<leader>lo", "Lspsaga LSoutlineToggle", "n", opts)
	mapkey("<leader>gf", "Lspsaga lsp_finder", "n", opts)

	if client.name == "pyright" then
		mapkey("<leader>oi", "PyrightOrganizeImports", "n", opts)
	end
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

return M
