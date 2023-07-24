require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'vscode',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
