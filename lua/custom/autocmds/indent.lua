-- Set indentation based on file type
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  command = 'setlocal noexpandtab tabstop=4 shiftwidth=4',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  command = 'setlocal expandtab tabstop=8 shiftwidth=2',
})

return {}
