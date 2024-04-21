-- search
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- slpit windows
vim.keymap.set('n', '<leader>s', ':vsplit<CR>')

-- nvim tree
vim.keymap.set('n', '<m-d>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<m-f>', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<m-c>', ':NvimTreeCollapse<CR>')

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<laader>fh', builtin.help_tags, {})

-- Bufferline
vim.keymap.set('n', '<m-n>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<m-p>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>co', ':BufferLineCloseOthers<CR>')

-- Git
vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- LSP references
vim.keymap.set('n', '<c-j>', ':cnext<CR>')
vim.keymap.set('n', '<c-k>', ':cprev<CR>')
