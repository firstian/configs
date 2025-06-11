return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = "onedark",
        -- Disable the fancy arrow because the vertical alignment of the font is broken.
        section_separators = "",
      },
      disabled_filetypes = {
        statusline = { "neo-tree" },
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    })
  end,
}
