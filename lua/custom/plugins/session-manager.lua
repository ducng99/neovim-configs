return {
  {
    'ducng99/neovim-session-manager',
    lazy = false,
    config = function()
      require('session_manager').setup {
        autoload_mode = require('session_manager.config').AutoloadMode.CurrentDirOrLastSession,
      }
    end,
    keys = {
      { '<leader>sml', '<cmd>SessionManager load_session<CR>', desc = 'Select a session' },
      { '<leader>sms', '<cmd>SessionManager save_current_session<CR>', desc = 'Save current session' },
    },
  },
}
