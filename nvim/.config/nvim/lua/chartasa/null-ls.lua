local null_ls_status_ok, null_ls = pcal(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

require("null-ls").setup({
    debug = false,
    source = {
        formatting.prettier,
        formatting.black.with({ extra_args = { "--fast"}}),
        formatting.stylua,
        diagnostics.flake8
        -- require("null-ls").builtins.formatting.stylua,
        -- require("null-ls").builtins.diagnostics.eslint,
        -- require("null-ls").builtins.completion.spell,
    },
})
