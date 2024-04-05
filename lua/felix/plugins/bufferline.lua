require("bufferline").setup({
  options = {
    buffer_close_icon = "",
    close_command = "bdelete %d",
    close_icon = "",
    offsets = {
      {
        filetype = "NvimTree",
        separator = true,
        text = "EXPLORER",
        highlight = "NvimTreeNormal",
      },
    },
    indicator_icon = " ",
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
      bg = "NONE"
    },
    buffer_selected = {
      bg = "NONE",
      italic = false
    },
  }
})

local fixBufferLineSeparator = function()
  vim.api.nvim_set_hl(
    0,
    "BufferLineOffsetSeparator",
    vim.api.nvim_get_hl_by_name('NvimTreeWinSeparator', true)
  )
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = fixBufferLineSeparator,
})

fixBufferLineSeparator()
