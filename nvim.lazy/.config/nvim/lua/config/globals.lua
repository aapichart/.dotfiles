-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set 'mapleader' before lazy so your mapping are correct
vim.g.maplocalleader = " "
vim.g.tree_sitter_cli_path = "$HOME/.nix-profile/bin/"
-- vim.g.python3_host_prog = "$HOME/.local/bin/pythonNvim/.venv/bin/python3"
vim.g.python3_host_prog = "/usr/bin/python3"
-- vim.g.python3_host_prog = "$HOME/.nix-profile/bin/python3.13"
vim.g.node_host_prog = vim.fn.expand("~") .. "/.nvm/versions/node/v23.5.0/lib/node_modules/neovim/bin/cli.js"
-- vim.g.node_host_prog = "$HOME/.nvm/versions/node/v23.5.0/bin/node"
vim.g.loaded_node_provider = 1
--
-- This setting is for Avante
vim.opt.laststatus = 3
