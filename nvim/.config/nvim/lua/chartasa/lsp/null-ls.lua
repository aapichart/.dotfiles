local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

require("null-ls").setup({
    debug = false,
    source = {
        formatting.prettier.with({ extra_args = { "--no-semi","--single-quote","--jsx-single-quote"}}),
        formatting.black.with({ extra_args = { "--fast"}}),
        formatting.stylua,
        diagnostics.flake8
        -- require("null-ls").builtins.formatting.stylua,
        -- require("null-ls").builtins.diagnostics.eslint,
        -- require("null-ls").builtins.completion.spell,
    },
})
