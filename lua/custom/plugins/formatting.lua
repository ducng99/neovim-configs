return {
  {
    {
      'mhartington/formatter.nvim',
      config = function()
        local filetypes = require 'formatter.filetypes'

        require('formatter').setup {
          filetype = {
            lua = {
              filetypes.lua.stylua,
            },
            javascript = {
              function()
                if vim.fn.filereadable '.eslintrc.json' or vim.fn.filereadable '.eslintrc.js' then
                  return filetypes.javascript.eslint_d()
                else
                  return filetypes.javascript.standard()
                end
              end,
            },
            javascriptreact = {
              function()
                if vim.fn.filereadable '.eslintrc.json' or vim.fn.filereadable '.eslintrc.js' then
                  return filetypes.javascriptreact.eslint_d()
                else
                  return filetypes.javascriptreact.standard()
                end
              end,
            },
            typescript = {
              function()
                if vim.fn.filereadable '.eslintrc.json' or vim.fn.filereadable '.eslintrc.js' then
                  return filetypes.typescript.eslint_d()
                else
                  return filetypes.typescript.tsfmt()
                end
              end,
            },
            typescriptreact = {
              function()
                if vim.fn.filereadable '.eslintrc.json' or vim.fn.filereadable '.eslintrc.js' then
                  filetypes.typescriptreact.eslint_d()
                else
                  return filetypes.typescriptreact.tsfmt()
                end
              end,
            },
            go = {
              filetypes.go.gofumpt,
              filetypes.go.gofumports,
            },
            php = {
              filetypes.php.php_cs_fixer,
            },
            yaml = {
              filetypes.yaml.yamlfmt,
            },
          },
        }
      end,
    },
  },
}
