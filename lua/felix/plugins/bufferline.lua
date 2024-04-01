require("bufferline").setup({
  options = {
    buffer_close_icon = "x",
    close_command = "bdelete %d",
    close_icon = "x",
    indicator = {
      style = "icon",
      icon = " ",
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "EXPLORER",
        text_align = "center"
      }
    },
    left_trunc_marker = "",
    modified_icon = "●",
    right_mouse_command = "bdelete! %d",
    right_trunc_marker = "",
    show_close_icon = false,
    show_tab_indicators = false,
  },
  highlights = {
    fill = {
      bg = "#1d2021"
    },
    background = {
      bg = "NONE"
    },
    tab_close = {
      bg = "NONE"
    },
    close_button = {
      bg = "NONE"
    },
    separator = {
      fg = "#fabd2f",
      bg = "NONE"
    },
    buffer_selected = {
      bg = "NONE"
    },
  }
})
