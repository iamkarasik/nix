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

		-- LSP
		DiagnosticUnnecessary = { fg = c.vscGray, bg = "None", undercurl = true, sp = c.vscYellowOrange },

		BufferLineFill = { link = "Background" },
		BufferLineIndicatorSelected = { link = "Background" },
		BufferLineIndicatorVisible = { link = "Background" },
		BufferLineBufferSelected = { fg = c.vscFront, bg = c.vscBack, bold = true, italic = false },
		BufferLineBufferVisible = { fg = c.vscFront, bg = c.vscBack, bold = true, italic = false },
		BufferLineCloseButtonSelected = { fg = c.vscFront, bg = c.vscBack, bold = true, italic = false },
		BufferLineCloseButtonVisible = { fg = c.vscFront, bg = c.vscBack, bold = true, italic = false },
		BufferLineCloseDuplicateSelected = { fg = c.vscFront, bg = c.vscBack, bold = true, italic = false },
		BufferLineCloseDuplicateVisible = { fg = c.vscFront, bg = c.vscBack, bold = true, italic = false },

		BufferLineModified = { fg = c.vscYellowOrange, bg = c.vscBack },
		BufferLineModifiedSelected = { fg = c.vscYellowOrange, bg = c.vscBack },
		BufferLineModifiedVisible = { fg = c.vscYellowOrange, bg = c.vscBack },

		-- NeoTreeRootName = { fg = c.vscFront, bg = "None", bold = false, italic = false },
		-- NeoTreeBufferLine = { link = "Background" },
		-- NeoTreeDimText = { link = "Background" },

		NvimTreeNormal = { link = "Normal" },

		-- Custom
		LualineTextModeNormal = { fg = c.vscBlue, bg = c.vscBack, bold = true },
		LualineTextModeVisual = { fg = c.vscYellowOrange, bg = c.vscBack, bold = true },
		LualineTextModeReplace = { fg = c.vscRed, bg = c.vscBack, bold = true },
		LualineTextModeInsert = { fg = c.vscGreen, bg = c.vscBack, bold = true },
		LualineTextModeCommand = { fg = c.vscPink, bg = c.vscBack, bold = true },
		LualineTextModeUnknown = { fg = c.vscLightBlue, bg = c.vscBack, bold = true },

		LualineIconModeNormal = { fg = c.vscBack, bg = c.vscBlue, bold = true },
		LualineIconModeVisual = { fg = c.vscBack, bg = c.vscYellowOrange, bold = true },
		LualineIconModeReplace = { fg = c.vscBack, bg = c.vscRed, bold = true },
		LualineIconModeInsert = { fg = c.vscBack, bg = c.vscGreen, bold = true },
		LualineIconModeCommand = { fg = c.vscBack, bg = c.vscPink, bold = true },
		LualineIconModeUnknown = { fg = c.vscBack, bg = c.vscLightBlue, bold = true },

		LualineIconGitBranch = { fg = c.vscBack, bg = c.vscRed, bold = true },
		LualineTextGitBranch = { fg = c.vscRed, bg = c.vscBack, bold = true },

		LualineIconLsp = { fg = c.vscBack, bg = c.vscGreen, bold = true },
		LualineTextLsp = { fg = c.vscGreen, bg = c.vscBack, bold = true },

		LualineIconCursor = { fg = c.vscBack, bg = c.vscYellowOrange, bold = true },
		LualineTextCursor = { fg = c.vscYellowOrange, bg = c.vscBack, bold = true },
	},
})

vim.cmd.colorscheme("vscode")
