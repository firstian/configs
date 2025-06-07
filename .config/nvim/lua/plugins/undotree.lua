return {
  'mbbill/undotree',
  lazy = false, -- needs to be explicitly set, because of the keys property
  keys = {
    {
      '<leader>u',
      vim.cmd.UndotreeToggle,
      desc = 'Toggle undotree',
    },
  },
  -- config = function()
  --     vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
  -- end
}
