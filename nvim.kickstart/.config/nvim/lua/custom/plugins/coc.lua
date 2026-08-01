return {
  'neoclide/coc.nvim',
  branch = 'release',
  lazy = false,
  build = 'npm ci',
  config = function()
    -- Define standard global coc extensions for your web/mobile toolchain
    vim.g.coc_global_extensions = {
      'coc-json',
      'coc-tsserver',
      'coc-html',
      'coc-css',
      'coc-flutter',
    }
    -- Helper option wrapper for keymapping
    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

    -- 1. Tab Autocompletion navigation

    function _G.check_back_space()
      local col = vim.fn.col '.' - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
    end
    vim.keymap.set('i', '<TAB>', 'coc#pum#visible()?coc#pum#next(1):v:lua.check_back_space()?"<TAB>":coc#refresh()', opts)
    vim.keymap.set('i', '<S-TAB>', [[coc#pum#visible()?coc#pum#prev(1):"<C-h>"]], opts)

    -- 2. Confirm selection with Enter/Return

    vim.keymap.set('i', '<CR>', [[coc#pum#visible()?coc#pum#confirm():"<C-g>u<CR><c-r>=coc#on_enter()<CR>"]], opts)

    -- 3. Standard Navigation Maps(Go to Definition, Reference etc.)

    local keys = { silent = true, noremap = true }
    vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', keys)
    vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', keys)
    vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', keys)
    vim.keymap.set('n', 'gr', '<Plug>(coc-references)', keys)
    -- For Flutter Coc commands
    vim.keymap.set('n', '<leader>fpg', ':CocCommand flutter.pub.get<CR>', keys)
    vim.keymap.set('n', '<leader>fd', ':CocCommand flutter.devices<CR>', keys)
    vim.keymap.set('n', '<leader>fa', ':CocCommand flutter.run<CR>', keys)
    vim.keymap.set('n', '<leader>fq', ':CocCommand flutter.dev.quit<CR>', keys)
    vim.keymap.set('n', '<leader>fl', ':CocCommand flutter.dev.openDevLog<CR>', keys)
    vim.keymap.set('n', '<leader>fcl', ':CocCommand flutter.dev.clearDevLog<CR>', keys)
    vim.keymap.set('n', '<leader>fr', ':CocCommand flutter.dev.hotReload<CR>', keys)
    vim.keymap.set('n', '<leader>fR', ':CocCommand flutter.dev.hotRestart<CR>', keys)
    vim.keymap.set('n', '<leader>ft', ':CocCommand flutter.dev.openDevToolsProfiler<CR>', keys)
    vim.keymap.set('n', '<leader>fp', ':CocCommand flutter.dev.openProfiler<CR>', keys)
    vim.keymap.set('n', '<leader>fpo', ':CocCommand flutter.dev.showPerformanceOverlay<CR>', keys)
    vim.keymap.set('n', '<leader>fio', ':CocCommand flutter.dev.showWidgetInspectorOverride<CR>', keys)
    vim.keymap.set('n', '<leader>fs', ':CocCommand flutter.dev.screenshot<CR>', keys)
    vim.keymap.set('n', '<leader>flr', ':CocCommand flutter.dev.restart<CR>', keys)
    vim.keymap.set('n', '<leader>rcf', ':CocCommand workspace.renameCurrentFile<CR>', keys)

    -- 4. Code Hover Documentation

    function _G.show_docs()
      local cw = vim.fn.expand '<cword>'
      if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.cmd('h' .. cw)
      elseif vim.fn.eval 'coc#rpc#ready()' then
        vim.fn.CocActionAsync 'doHover'
      else
        vim.cmd('!' .. vim.o.keywordprg .. '' .. cw)
      end
      vim.keymap.set('n', 'K', '<CMD>lua_G.show_docs()<CR>', keys)
    end

    -- 5. Diagnostics Action Maps
    vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', keys)
    vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', keys)
    vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', keys)
    vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction-cursor)', keys)
  end,
}
