local Util = require 'custom.utils'

vim.keymap.set('n', '<leader>gg', function()
  Util.float_term({ 'lazygit' }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = 'Lazygit (root dir)' })

return {}
