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
        fg = { attribute = 'fg', highlight = 'Normal' },
        bg = { attribute = 'bg', highlight = 'StatusLine' },
      },
      buffer_visible = {
        fg = { attribute = 'fg', highlight = 'Normal' },
        bg = { attribute = 'bg', highlight = 'Normal' },
      },
      buffer_selected = {
        fg = { attribute = 'fg', highlight = 'Normal' },
        bg = { attribute = 'bg', highlight = 'Normal' },
      },
      separator = {
        fg = { attribute = 'bg', highlight = 'Normal' },
        bg = { attribute = 'bg', highlight = 'StatusLine' },
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
        fg = { attribute = 'fg', highlight = 'Normal' },
        bg = { attribute = 'bg', highlight = 'StatusLine' },
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
