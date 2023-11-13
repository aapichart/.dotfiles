local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Directory Navigation
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

-- Pane and Window Navigation between pane
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right
keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts) -- Navigate Left
keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts) -- Navigate Right
keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts) -- Navigate Up
keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts) -- Navigate Down
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts) -- Navigate Left
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", opts) -- Navigate Right
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", opts) -- Navigate Down
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", opts) -- Navigate Up

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizentally
keymap.set("n", "<leader>sM", "<C-w>| <C-w>_", opts) -- Toggle Maxzimize
keymap.set("n", "<leader>sm", "<C-w>=", opts) -- Toggle Maxzimize

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Mapping key for lf, lf need floatTerm
vim.g.lf_open_new_tab = 0
vim.g.lf_map_keys = 0
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
keymap.set("n", "<leader>lf", ":Lfcd<CR>", opts)

-- Comments
vim.api.nvim_set_keymap("n", "<leader>cc", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<leader>cc", "gc", { noremap = false })

-- Move between buffers
-- vim.api.nvim_set_keymap("n", "<tab>", ":bn<CR>", { noremap = false })
-- vim.api.nvim_set_keymap("n", "<s-tab>", ":bp<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<tab>", "gT", { noremap = false })
vim.api.nvim_set_keymap("n", "<s-tab>", "gt", { noremap = false })
