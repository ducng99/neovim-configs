return {
  {
    'VonHeikemen/lsp-zero.nvim',
    event = { 'BufRead', 'BufWinEnter', 'BufNewFile' },
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'folke/neodev.nvim' },

      -- Formatting
      { 'mhartington/formatter.nvim' },
    },
    build = function()
      vim.cmd 'MasonInstallAll'
    end,
    config = function()
      local lsp = require('lsp-zero').preset {}

      lsp.on_attach(function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')

        nmap('gr', function()
          require('telescope.builtin').lsp_references()
        end, '[G]oto [R]eferences')

        nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

        nmap('<leader>ds', function()
          require('telescope.builtin').lsp_document_symbols()
        end, '[D]ocument [S]ymbols')

        nmap('<leader>ws', function()
          require('telescope.builtin').lsp_dynamic_workspace_symbols()
        end, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        vim.keymap.set({ 'n', 'x' }, '<leader>fm', '<cmd>Format<CR>', { desc = 'Format document', buffer = bufnr })
      end)

      lsp.ensure_installed {
        'cssls',
        'eslint',
        'gopls',
        'lua_ls',
        'svelte',
        'tsserver',
        'intelephense',
        'docker_compose_language_service',
        'dockerls',
        'yamlls',
      }

      local other_tools = {
        'gofumpt',
        'goimports-reviser',
        'standardjs',
        'ts-standard',
        'stylua',
        'eslint_d',
        'yamlfmt',
        'php-cs-fixer',
        'php-debug-adapter',
      }

      -- Install other tools with Mason (not LSP)
      -- custom nvchad cmd to install all mason binaries listed
      vim.api.nvim_create_user_command('MasonInstallAll', function()
        vim.cmd('MasonInstall ' .. table.concat(other_tools, ' '))
      end, {})

      -- Setup neodev for vim syntax
      require('neodev').setup {}

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()

      -- Additional mappings
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup {
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
      }
    end,
  },
}
