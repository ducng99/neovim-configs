return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  -- See `:help lualine.txt`
  opts = {
    options = {
      theme = 'vscode',
    },
    sections = {
      lualine_c = {
        function()
          local buffer_path = vim.api.nvim_buf_get_name(0)
          local _, end_index = buffer_path:find(vim.loop.cwd(), 1, true)
          if end_index then
            return buffer_path:sub(end_index + 1)
          else
            return buffer_path
          end
        end,
      },
      lualine_x = {
        function()
          local author = vim.b.gitsigns_blame_line_dict.author
          if vim.b.gitsigns_blame_line_dict.author == 'Not Committed Yet' then
            author = 'You'
          end

          return author .. ', ' .. require('gitsigns.util').get_relative_time(vim.b.gitsigns_blame_line_dict.author_time)
        end,
        'encoding',
        'fileformat',
        'filetype',
      },
      lualine_y = { 'location' },
      lualine_z = {
        function()
          local pathname = vim.loop.cwd() or ''

          -- remove trailing-slashes
          local head = pathname:find('/+$', 2)
          if head then
            pathname = pathname:sub(1, head - 1)
          end

          -- extract last-segment
          head = pathname:find '[^/]+$'
          if head then
            pathname = pathname:sub(head)
          end

          return pathname
        end,
      },
    },
  },
}
