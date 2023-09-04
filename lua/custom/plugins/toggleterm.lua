return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = "<C-`>",
      insert_mappings = false,
    },
    cmd = { 'ToggleTerm', 'TermSelect', 'TermExec' },
    keys = {
      '<leader>t',
      {
        '<M-v>',
        function()
          vim.cmd('ToggleTerm direction=vertical size=' .. vim.o.columns * 0.4)
        end,
      },
      {
        '<M-h>',
        function()
          vim.cmd('ToggleTerm direction=horizontal size=' .. vim.o.lines * 0.4)
        end,
      },
    },
  },
}
