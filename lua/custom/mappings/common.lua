-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>', { desc = 'Clear highlights', silent = true })
vim.keymap.set({ 'n', 'v', 'i', 'x' }, '<C-c>', '<Esc>', { desc = 'Esc', silent = true, remap = true })

-- Remap half page navigations
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { desc = 'Move half page down' })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { desc = 'Move half page up' })

-- Remap movements in Insert mode
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move left' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move right' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Move up' })

-- Windows navigations
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to down window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to up window' })

-- Terminal navigations
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- yank from ThePrimeagen :)
-- Keep search results centred
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Move to next search match' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Move to previous search match' })
-- Move selected block up/down
vim.keymap.set('v', 'J', ":move '>+1<CR>gv=gv", { desc = 'Move selected block down' })
vim.keymap.set('v', 'K', ":move '<-2<CR>gv=gv", { desc = 'Move selected block up' })
-- Search & replace selected
vim.keymap.set('v', '<C-h>', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { desc = 'Search & replace selected' })

return {}
