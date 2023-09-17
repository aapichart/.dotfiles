-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
    },
    folder = {
        -- arrow_open = " ",
        -- arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
    },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    print('no nvim_tree plugin')
    return
end


nvim_tree.setup {
    on_attach = my_on_attach,
    hijack_directories = {
        enable = false,
    },
    -- update_to_buf_dir = {
    --   enable = false,
    -- },
    disable_netrw = true,
    hijack_netrw = true,
    -- open_on_setup = false,
    --ignore_ft_on_setup = {
    --"startify",
    --"dashboard",
    --"alpha",
    --},
    -- auto_close = true,
    -- open_on_tab = false,
    -- hijack_cursor = false,
    update_cwd = true,
    -- update_to_buf_dir = {
    --   enable = true,
    --   auto_open = true,
    -- },
    -- --   error
    -- --   info
    -- --   question
    -- --   warning
    -- --   lightbulb
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    -- system_open = {
    --   cmd = nil,
    --   args = {},
    -- },
    -- filters = {
    --   dotfiles = false,
    --   custom = {},
    -- },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = "40%",
        --height = 30,
        hide_root_folder = false,
        side = "left",
        --auto_resize = true,
        --mappings = {
        --custom_only = false,
        --list = {
        --{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        --{ key = "h",                  cb = tree_cb "close_node" },
        --{ key = "v",                  cb = tree_cb "vsplit" },
        --},
        --},
        number = false,
        relativenumber = false,
    },
    sort = {
        sorter = "case_sensitive",
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    -- trash = {
    --   cmd = "trash",
    --   require_confirm = true,
    -- },
    -- quit_on_open = 0,
    -- git_hl = 1,
    -- disable_window_picker = 0,
    -- root_folder_modifier = ":t",
    -- show_icons = {
    --   git = 1,
    --   folders = 1,
    --   files = 1,
    --   folder_arrows = 1,
    --   tree_width = 30,
    -- },
}
