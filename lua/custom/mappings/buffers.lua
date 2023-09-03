vim.keymap.set({ 'n', 'v' }, '<leader>bd', '<cmd>bp<bar>bd!#<CR>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>enew<CR>', { desc = 'Open new buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })

return {}
