require('lualine').setup {
  options = {
    icons_enabled = true,
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
