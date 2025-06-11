-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Limit Blink completion for filetypes. We can't do it in the enabled
-- function in the plugin config, because for some reason vim.bo.filetype is
-- empty there. We use the FileType event to ensure the logic is run when
-- the filetype is set.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local enabled_filetypes = {
      --"c", "cpp",
      "lua",
      "python",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "rust",
    }
    vim.b.completion = vim.tbl_contains(enabled_filetypes, vim.bo.filetype)
  end,
})

-- Disable auto-spell set up by another autocmd in LazyVim
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
