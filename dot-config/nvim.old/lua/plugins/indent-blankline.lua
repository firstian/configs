return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  main = 'ibl',
  opts = {
    indent = { char = '┊' },
  },
  keys = {
    {
      '<C-i>',
      vim.cmd.IBLToggle,
      desc = 'Toggle indent guides',
    },
  },
  -- By default hide the indentation guide
  config = function()
    vim.schedule(function()
      vim.cmd 'IBLDisable'
    end)
  end,
}
