vim.g.lf_open_new_tab = 1
vim.g.lf_map_keys = 0
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

-- lf swap buffer by using key tab and shift-tab
vim.keymap.set("n", "<tab>", "gt")
vim.keymap.set("n", "<s-tab>", "gT")
