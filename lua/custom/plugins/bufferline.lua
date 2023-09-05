return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  opts = {
    options = {
      separator_style = { '▏', '▕' },
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Explorer',
          text_align = 'left',
          separator = true,
        },
      },
    },
    highlights = {
      background = {
        fg = { attribute = 'fg', highlight = 'TabLineFill' },
        bg = { attribute = 'bg', highlight = 'TabLineFill' },
      },
      buffer_visible = {
        fg = { attribute = 'fg', highlight = 'TabLine' },
        bg = { attribute = 'bg', highlight = 'TabLine' },
      },
      buffer_selected = {
        fg = { attribute = 'fg', highlight = 'TabLineSel' },
        bg = { attribute = 'bg', highlight = 'TabLineSel' },
        italic = false,
        bold = false,
      },
      separator = {
        fg = { attribute = 'fg', highlight = 'TabLineSeparator' },
        bg = { attribute = 'bg', highlight = 'TabLineFill' },
      },
      separator_selected = {
        fg = { attribute = 'fg', highlight = 'TabLineSeparator' },
        bg = { attribute = 'bg', highlight = 'TabLineSel' },
      },
      separator_visible = {
        fg = { attribute = 'fg', highlight = 'TabLineSeparator' },
        bg = { attribute = 'bg', highlight = 'TabLine' },
      },
      close_button = {
        fg = { attribute = 'fg', highlight = 'TabLineFill' },
        bg = { attribute = 'bg', highlight = 'TabLineFill' },
      },
      close_button_selected = {
        fg = { attribute = 'fg', highlight = 'TabLineSel' },
        bg = { attribute = 'bg', highlight = 'TabLineSel' },
      },
      close_button_visible = {
        fg = { attribute = 'fg', highlight = 'TabLine' },
        bg = { attribute = 'bg', highlight = 'TabLine' },
      },
    },
  },
}
