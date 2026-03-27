require("bufferline").setup({
	highlights = {
		buffer_selected = { italic = false },
		buffer_visible = { italic = false },
		modified = { italic = false },
	},
	options = {
		show_buffer_icons = false,
		show_buffer_close_icons = true,
		truncate_names = false,
		indicator = {
			style = "none",
		},
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
				highlight = "NeoTreeNormal",
			},
		},
	},
})
