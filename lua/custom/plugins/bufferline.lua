return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  config = true,
  opts = {
    options = {
      modified_icon = '●',
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          text_align = 'left',
          separator = true,
        },
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
    },
    highlights = {
      fill = {
        fg = { attribute = 'fg', highlight = 'Normal' },
        bg = { attribute = 'bg', highlight = 'StatusLineNC' },
      },
      background = {
        fg = { attribute = 'fg', highlight = 'BufferInactive' },
        bg = { attribute = 'bg', highlight = 'BufferInactive' },
      },
      buffer_visible = {
        fg = { attribute = 'fg', highlight = 'BufferVisible' },
        bg = { attribute = 'bg', highlight = 'BufferVisible' },
      },
      buffer_selected = {
        fg = { attribute = 'fg', highlight = 'BufferCurrent' },
        bg = { attribute = 'bg', highlight = 'BufferCurrent' },
        italic = false,
      },
      separator = {
        fg = { attribute = 'bg', highlight = 'BufferInactive' },
        bg = { attribute = 'bg', highlight = 'BufferInactive' },
      },
      separator_selected = {
        fg = { attribute = 'fg', highlight = 'Special' },
        bg = { attribute = 'bg', highlight = 'Normal' },
      },
      separator_visible = {
        fg = { attribute = 'fg', highlight = 'Normal' },
        bg = { attribute = 'bg', highlight = 'StatusLineNC' },
      },
      close_button = {
        fg = { attribute = 'fg', highlight = 'BufferInactive' },
        bg = { attribute = 'bg', highlight = 'BufferInactive' },
      },
      close_button_selected = {
        fg = { attribute = 'fg', highlight = 'Normal' },
        bg = { attribute = 'bg', highlight = 'Normal' },
      },
      close_button_visible = {
        fg = { attribute = 'fg', highlight = 'Normal' },
        bg = { attribute = 'bg', highlight = 'Normal' },
      },
    },
  },
}
