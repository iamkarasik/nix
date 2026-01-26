local window = {
	border = "rounded",
}

require("blink.cmp").setup({
	keymap = { preset = "default" },

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		menu = {
			draw = {
				padding = 1,
				gap = 2,
				components = {
					source_name = {
						text = function(ctx)
							return "[" .. ctx.source_name .. "]"
						end,
					},
				},
				columns = {
					{ "source_name" },
					{ "label", "label_description", gap = 1 },
					{ "kind_icon", "kind", gap = 1 },
				},
			},
			border = "rounded",
		},
		documentation = {
			auto_show = false,
			window = window,
		},
	},

	signature = {
		enabled = true,
		trigger = {
			enabled = true,
			show_on_trigger_character = false,
			show_on_insert_on_trigger_character = false,
		},
		window = window,
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
})
