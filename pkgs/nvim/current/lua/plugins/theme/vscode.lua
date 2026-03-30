vim.o.background = "dark"

local c = require("vscode.colors").get_colors()

require("vscode").setup({
	transparent = true,
	italic_comments = false,
	italic_inlayhints = false,
	underline_links = true,
	terminal_colors = true,

	color_overrides = {
		-- vscLineNumber = "#FFFFFF",
	},

	group_overrides = {
		Background = { fg = c.vscGray, bg = c.vscBack, bold = false, italic = false },

		BufferLineFill = { link = "Background" },
		BufferLineOffsetSeparator = { link = "Background" },

		DiagnosticUnnecessary = { fg = c.vscGray, bg = "None", undercurl = true, sp = c.vscYellow },

		NeoTreeRootName = { fg = c.vscFront, bg = "None", bold = false, italic = false },
		NeoTreeBufferLine = { link = "Background" },
		NeoTreeIndentMarker = { link = "Background" },
		NeoTreeDimText = { link = "Background" },
	},
})

-- local hl = vim.api.nvim_set_hl

vim.cmd.colorscheme("vscode")
