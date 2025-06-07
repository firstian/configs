return {
  'mason-org/mason.nvim',
  dependencies = {
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer',
  },
  config = function()
    require('mason').setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    require('mason-lspconfig').setup {
      ensure_installed = {
        'bashls',
        'clangd',
        'cssls',
        'css_variables',
        'cssmodules_ls',
        'emmet_ls',
        'html',
        'lua_ls',
        'pyright',
        'rust_analyzer',
        'ts_ls',
      },
    }

    require('mason-tool-installer').setup {
      ensure_installed = {
        'codespell',
        'eslint_d',
        'markdownlint',
        'prettier',
        'stylua',
        'ruff',
        --'pylint',
        -- 'isort',
        -- 'black',
      },
    }
  end,
}
