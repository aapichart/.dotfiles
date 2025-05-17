return {

  -- Pane and Window Navigation between pane
  vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Navigate Left' }),
  vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Navigate Down' }), -- Navigate Dow
  vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Navigate Up' }), -- Navigate Up
  vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Navigate Right' }), -- Navigate Right
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = 'Navigate Left' }), -- Navigate Left
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = 'Navigate Right' }), -- Navigate Right
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = 'Navigate Up' }), -- Navigate Up
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = 'Navigate Down' }), -- Navigate Down
  vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>', { desc = 'Navigate Left' }), -- Navigate Left
  vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<CR>', { desc = 'Navigate Right' }), -- Navigate Right
  vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>', { desc = 'Navigate Down' }), -- Navigate Down
  vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>', { desc = 'Navigate Up' }), -- Navigate Up

  -- Window Management
  vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split Vertically' }), -- Split Vertically
  vim.keymap.set('n', '<leader>sh', ':split<CR>', { desc = 'Split Horizentally' }), -- Split Horizentally
  vim.keymap.set('n', '<leader>sM', '<C-w>| <C-w>_', { desc = 'Toggle Maxzimize' }), -- Toggle Maxzimize
  vim.keymap.set('n', '<leader>sm', '<C-w>=', { desc = 'Toggle Maxzimize' }), -- Toggle Maxzimize

  -- Indenting
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Esc Insert Select' }),

  -- Mapping key for lf, lf need floatTerm
  vim.g.lf_open_new_tab == 0,
  vim.g.lf_map_keys == 0,
  vim.g.floaterm_width == 0.9,
  vim.g.floaterm_height == 0.9,
  vim.keymap.set('n', '<leader>lf', '<Cmd>Lf<CR>', { noremap = false }),

  -- Mapping key for Obsidian
  vim.keymap.set('n', '<leader>os', '<Cmd>ObsidianSearch<CR>', { noremap = false }),
  vim.keymap.set('n', '<leader>on', '<Cmd>ObsidianNewFromTemplate<CR>', { noremap = false }),
  vim.keymap.set('n', '<leader>od', '<Cmd>ObsidianDailies<CR>', { noremap = false }),
  vim.keymap.set('n', '<leader>oc', '<Cmd>ObsidianToggleCheckbox<CR>', { noremap = false }),
  vim.keymap.set('n', '<leader>oq', '<Cmd>ObsidianQuickSwitch<CR>', { noremap = false }),

  -- Move between buffers
  vim.keymap.set('n', '<leader>fn', '<Cmd>bnext<CR>', { noremap = false }),
  vim.keymap.set('n', '<leader>fp', '<Cmd>bprevious<CR>', { noremap = false }),
  -- disable tab key to switch buffers, using telescope buffers instead
  vim.api.nvim_set_keymap('n', '<tab>', 'gT', { noremap = false }),
  vim.api.nvim_set_keymap('n', '<s-tab>', 'gt', { noremap = false }),

  -- Ending terminal command mode with <leader>e key
  vim.keymap.set('t', '<C-\\>', '<C-\\><C-n><C-\\>', { noremap = false }),
  vim.keymap.set('n', '<leader>lf', '<Cmd>Lf<CR>', { desc = 'run lf app' }),
  vim.keymap.set('v', '<', '<gv', { desc = 'undent line by Tab' }),
  vim.keymap.set('v', '>', '>gv', { desc = 'indent line by Tab' }),

  -- Move code to another location by up or down in visual mode
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlight one line up.' }),
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlight one line down. ' }),
  vim.keymap.set('i', 'J', '<Esc>:m .+1<CR>==gi', { noremap = false }),
  vim.keymap.set('i', 'K', '<Esc>:m .-2<CR>==gi', { noremap = false }),
}
