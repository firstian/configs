-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- TIP: Disable arrow keys in normal mode
keymap.set({ "n" }, "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set({ "n" }, "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap.set({ "n" }, "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set({ "n" }, "<down>", '<cmd>echo "Use j to move!!"<CR>')

--  See `:help wincmd` for a list of all window commands
-- keymap.set({"n", "i"}, "<M-Left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- keymap.set({"n", "i"}, "<M-Right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- keymap.set({"n", "i"}, "<M-Down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- keymap.set({"n", "i"}, "<M-Up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
