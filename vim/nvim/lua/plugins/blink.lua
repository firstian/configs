return {
	"saghen/blink.cmp",
	completion = {
		trigger = {
			show_on_keyword = false,
		},
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
		},
	},
}
