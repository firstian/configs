-- Rip this off from nvim_cmp
local function in_treesitter_capture(capture)
  local buf = vim.api.nvim_get_current_buf()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  row = row - 1
  if vim.api.nvim_get_mode().mode == "i" then
    col = col - 1
  end

  local captures_at_cursor = vim.tbl_map(function(x)
    return x.capture
  end, require("vim.treesitter").get_captures_at_pos(buf, row, col))

  if vim.tbl_isempty(captures_at_cursor) then
    return false
  elseif type(capture) == "string" and vim.tbl_contains(captures_at_cursor, capture) then
    return true
  elseif type(capture) == "table" then
    for _, v in ipairs(capture) do
      if vim.tbl_contains(captures_at_cursor, v) then
        return true
      end
    end
  end

  return false
end

return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        selection = {
          auto_insert = false,
        },
      },
      menu = {
        auto_show = function()
          return not in_treesitter_capture({ "comment", "string" })
        end,
        border = "rounded",
      },
      trigger = {
        show_in_snippet = false,
      },
    },
    fuzzy = {
      sorts = {
        "exact",
        "score",
        "sort_text",
      },
    },
    keymap = {
      preset = "super-tab",
    },
    sources = {
      providers = {
        lsp = {
          name = "LSP",
          module = "blink.cmp.sources.lsp",
          transform_items = function(_, items)
            return vim.tbl_filter(function(item)
              return item.kind ~= require("blink.cmp.types").CompletionItemKind.Keyword
            end, items)
          end,
        },
        path = {
          opts = {
            get_cwd = function(_)
              return vim.fn.getcwd()
            end,
          },
        },
        snippets = {
          name = "Snippets",
          -- Disable snippets to cut down the noise.
          enabled = false,
        },
      },
    },
  },
}
