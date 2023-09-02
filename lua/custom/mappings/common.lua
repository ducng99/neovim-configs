-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>', { desc = 'Clear highlights' })
vim.keymap.set('v', '<S-j>', 'j', { desc = 'Move down' })
vim.keymap.set('v', '<S-k>', 'k', { desc = 'Move up' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap half page navigations
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { desc = 'Move half page down' })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { desc = 'Move half page up' })

-- Windows navigations
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to down window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to up window' })

-- Terminal navigations
vim.keymap.set({ 'n', 'x', 'v', 'i' }, '<M-v>', '<cmd>vsp +term<CR>i', { desc = 'Open terminal in vertical split' })
vim.keymap.set({ 'n', 'x', 'v', 'i' }, '<M-s>', '<cmd>sp +term<CR>i', { desc = 'Open terminal in horizontal split' })
vim.keymap.set({ 't' }, '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

return {}
