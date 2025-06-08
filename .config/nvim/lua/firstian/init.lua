require 'firstian.options'
require 'firstian.remap'
-- remap and options happens before lazy.nvim loads the plugins.
require 'firstian.lazy'

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup ' .. group_name)
    vim.api.nvim_command 'autocmd!'
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command 'augroup END'
  end
end

local autoCommands = {
  -- other autocommands
  open_folds = {
    --{ 'BufReadPost,FileReadPost', '*', 'normal zR' },
    { 'BufEnter,BufWinEnter', '*', 'normal zR' },
  },
}

M.nvim_create_augroups(autoCommands)
