-- Setting lsp-zero
local status_ok, lsp_zero = pcall(require, "lsp-zero")
if not status_ok then
    return
end
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

-- Setting up for nvim-lsp-installer
local status_ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    -- if server.name == "sumneko_lua" then
        -- opts = {
            -- setting = {
                -- Lua = {
                    -- diagnostics = {
                        -- globals = {'vim','use'}
                    -- },
                -- }
        -- }
    --}
    --end
    server:setup(opts)
end)

-- nvim-cmp
local status_ok, lsp_cmp = pcall(require, "cmp")
if not status_ok then
	return
end
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

-- better autocompletin experience
vim.o.completeopt = 'menuone,noselect'

cmp.setup {
    -- Format the autocomplete menu
    formatting = {
        format = lspkind.cmp_format()
    },
    mapping = {
        -- Use Tab and shift-Tab to navigate autocomplete menu
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
        -- Create Problem after Enter in insert mode, This will show "<Plug>(cmp.u.k.recursive)"
        -- ['<CR>'] = cmp.mapping.confirm {
            -- behavior = cmp.ConfirmBehavior.Replace,
            -- select = true,
        -- },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}
