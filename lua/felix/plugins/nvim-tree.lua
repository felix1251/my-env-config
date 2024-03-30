vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  view = {
    width = "210",
    side = "left",
  },
})
