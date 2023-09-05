-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Git related plugins
  -- {
  --   'tpope/vim-fugitive',
  --   cmd = { 'Git', 'G' },
  -- },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth',
    event = 'VeryLazy',
  },

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = { '<leader>', ' ', '<Space>', '<c-r>', '"', "'", '`', 'c', 'v', 'g', 'd' },
    cmd = 'WhichKey',
    opts = {},
  },

  {
    'Mofiqul/vscode.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('vscode').setup {
        transparent = true,
        disable_nvimtree_bg = true,
        group_overrides = {
          DiagnosticUnnecessary = { fg = '#73a1bb' },
          CopilotAnnotation = { fg = '#d4d4d4' },
          CopilotSuggestion = { fg = '#6b6b6b' },
          CursorLineNr = { fg = '#d4d4d4' },
          CursorLine = {}, -- Disable CursorLine colour. We need cursorline for CursorLineNr only
          IlluminatedWordText = { bg = '#484848', underline = false },
          IlluminatedWordRead = { bg = '#484848', underline = false },
          IlluminatedWordWrite = { bg = '#484848', underline = false },
          ['@attribute'] = { link = '@keyword.function' },
          ['@keyword.jsdoc'] = { link = '@keyword.function' },
          ['@text.phpdoc'] = { link = 'Comment' },
        },
      }
      require('vscode').load()
    end,
  },

  {
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
        lualine_y = { 'location' },
        lualine_z = { 'os.date("%R")' },
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    opts = {
      char = '┊',
      show_current_context = true,
    },
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gcc', mode = 'n', desc = 'Comment toggle current line' },
      { 'gc', mode = { 'n', 'o' }, desc = 'Comment toggle linewise' },
      { 'gc', mode = 'x', desc = 'Comment toggle linewise (visual)' },
      { 'gbc', mode = 'n', desc = 'Comment toggle current block' },
      { 'gb', mode = { 'n', 'o' }, desc = 'Comment toggle blockwise' },
      { 'gb', mode = 'x', desc = 'Comment toggle blockwise (visual)' },
    },
    opts = {},
  },

  -- Highlights selected variable
  {
    'RRethy/vim-illuminate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('illuminate').configure {
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { 'lsp' },
        },
      }
    end,
  },

  {
    'stevearc/dressing.nvim',
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.input(...)
      end
    end,
  },

  -- require 'kickstart.plugins.debug',

  { import = 'custom.plugins' },

  -- Use lazy.nvim to load all files in dir
  { import = 'custom.mappings' },
  { import = 'custom.autocmds' },
}, {
  defaults = {
    lazy = true,
  },
})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- I like this ok
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Enable cursorline so CursorLineNr can work
vim.opt.cursorline = true

-- Decrease update time
vim.opt.updatetime = 50
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- Set top and bottom offset when scrolling
vim.opt.scrolloff = 8

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

-- Disable netrw because we have tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set split directions
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable word-wrap
vim.opt.wrap = false

-- Wraps left/right movements to previous/next line
vim.opt.whichwrap = vim.o.whichwrap .. ',<,>'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
