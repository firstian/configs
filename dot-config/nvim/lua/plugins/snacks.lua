vim.g.snacks_animate = false

return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      ignored = true,
      exclude = { "node_modules", ".git", ".DS_Store" },
    },
  },
}
