-- Example using a list of specs with the default options
vim.g.tree_sitter_cli_path = "$HOME/.nix-profile/bin/"
-- vim.g.node_host_prog = vim.fn.expand("~") .. "/.nvm/versions/node/v23.11.0/lib/node_modules/neovim/bin/cli.js"
vim.g.node_host_prog = "$HOME/.nvm/versions/node/v23.11.0/bin/node"
vim.g.loaded_node_provider = 1
--
-- This setting is for Avante
vim.opt.laststatus = 3

