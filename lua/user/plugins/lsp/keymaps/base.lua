return function(bufnr)
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions

    vim.keymap.set('n', '<leader>lp', ':lua vim.diagnostic.goto_prev()<CR>', {desc = 'diagnostic goto prev'})
    vim.keymap.set('n', '<leader>ln', ':lua vim.diagnostic.goto_next()<CR>', {desc = 'diagnostic goto next'})
    vim.keymap.set('n', '<leader>ls', ':lua vim.diagnostic.setloclist()<CR>', {desc = 'diagnostic setloclist'})
    vim.keymap.set('n', '<leader>lx', ':TroubleToggle<CR>', {desc = 'TroubleToggle'})
    vim.keymap.set('n', '<leader>lq', ':TroubleToggle quickfix<CR>', {desc = 'Trouble quickfix'})
    --vim.keymap.set('n', '<leader>lD', ':lua vim.lsp.buf.declaration()<CR>', {desc = 'declaration'})
    --vim.keymap.set('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', {desc = 'definition'})
    --vim.keymap.set('n', '<leader>lg', ':lua vim.lsp.buf.references()<CR>', {desc = 'references'})
    --vim.keymap.set('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', {desc = 'implementation'})
    vim.keymap.set('n', '<leader>ld', ':Lspsaga lsp_finder<CR>', {desc = 'lsp finder'})
    vim.keymap.set('n', '<leader>lh', ':Lspsaga hover_doc<CR>', {desc = 'hover'})
    vim.keymap.set('n', '<leader>lk', ':lua vim.lsp.buf.signature_help()<CR>', {desc = 'signature_help'})
    vim.keymap.set('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<CR>', {desc = 'type_definition'})
    vim.keymap.set('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', {desc = 'rename'})
    vim.keymap.set('n', '<leader>lc', ':lua vim.lsp.buf.code_action()<CR>', {desc = 'code_action'})
    vim.keymap.set('n', '<leader>lf', ':lua vim.lsp.buf.format({async = true})<CR>', {desc = 'formatting'})
    vim.keymap.set('n', '<leader>lwa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', {desc = 'add_workspace_folder'})
    vim.keymap.set('n', '<leader>lwr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', {desc = 'remove_workspace_folder'})
    vim.keymap.set('n', '<leader>lwl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', {desc = 'list_workspace_folders'})
end
