require("bufferline").setup({
	highlights = {
		background = { link = "Background" },
		buffer_visible = { link = "Background" },
		buffer_selected = { italic = false },

		close_button = { link = "Background" },
		close_button_visible = { link = "Background" },
	},
	options = {
		show_buffer_icons = false,
		show_buffer_close_icons = true,
		truncate_names = false,
		buffer_close_icon = "",
		indicator = { style = "none" },
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				text_align = "left",
				highlight = "NeoTreeBufferLine"
			},
		},
		separator_style = { "", "" },
	},
})
