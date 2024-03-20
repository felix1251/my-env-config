-- search
vim.keymap.set('n', '<leader>h', 'nohlsearchCR>')

-- nvim tree
vim.keymap.set('n', '<m-d>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<m-f>', ':NvimTreeFocus<CR>')

-- animations
vim.keymap.set("n", "<leader>rain", "<cmd>CellularAutomaton make_it_rain<CR>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<laader>fh', builtin.help_tags, {})

-- Git
vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')
