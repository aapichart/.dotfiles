local telescope = require('telescope.builtin')
if not telescope then
    return
end

vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<C-p>', telescope.git_files, {})

vim.keymap.set('n', '<leader>ps', function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") }); 
end)
