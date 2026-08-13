vim.o.background = "dark"

local c = require("vscode.colors").get_colors()

require("vscode").setup({
	transparent = true,
	italic_comments = false,
	italic_inlayhints = false,
	underline_links = true,
	terminal_colors = true,

	color_overrides = {
		-- vscLineNumber = c.vscBlue,
	},

	group_overrides = {
		Background = { fg = c.vscGray, bg = c.vscBack, bold = false, italic = false },
		StatusLine = { link = "Background" },
		StatusLineNC = { link = "Background" },
		WinSeparator = { fg = c.vscBack, bg = "NONE", bold = false, italic = false },
		VertLine = { fg = c.vscLineNumber, bg = c.vscBack },

		-- Indent Blankline
		IblIndent = { link = "VertLine" },
		["@ibl.indent.char.1"] = { link = "VertLine" },

		-- LSP
		DiagnosticUnnecessary = { fg = c.vscGray, bg = "None", undercurl = true, sp = c.vscYellowOrange },

		-- BufferLine
		BufferLineFill = { link = "Background" },
		BufferLineIndicatorSelected = { link = "Background" },
		BufferLineIndicatorVisible = { link = "Background" },
		BufferLineBufferSelected = { fg = c.vscFront, bg = c.vscBack, bold = true, italic = false },
		BufferLineBufferVisible = { fg = c.vscFront, bg = c.vscBack, bold = false, italic = false },
		BufferLineCloseButtonSelected = { fg = c.vscFront, bg = c.vscBack, bold = true, italic = false },
		BufferLineCloseButtonVisible = { fg = c.vscFront, bg = c.vscBack, bold = false, italic = false },
		BufferLineCloseDuplicateSelected = { fg = c.vscFront, bg = c.vscBack, bold = true, italic = false },
		BufferLineCloseDuplicateVisible = { fg = c.vscFront, bg = c.vscBack, bold = false, italic = false },

		BufferLineModified = { fg = c.vscYellowOrange, bg = c.vscBack },
		BufferLineModifiedSelected = { fg = c.vscYellowOrange, bg = c.vscBack },
		BufferLineModifiedVisible = { fg = c.vscYellowOrange, bg = c.vscBack },

		-- NvimTree
		NvimTreeNormal = { link = "Normal" },
		NvimTreeTitle = { link = "Background" },
		NvimTreeIndentMarker = { link = "VertLine" },
		NvimTreeCursorLine = { link = "CursorLine" },
		NvimTreeModifiedIcon = { fg = c.vscYellowOrange, bg = c.vscBack },
		NvimTreeGitFileNewHL = { link = "NvimTreeModifiedIcon" },
		NvimTreeGitFileStagedHL = { link = "NvimTreeModifiedIcon" },
		NvimTreeGitFileDirtyHL = { link = "NvimTreeModifiedIcon" },
		NvimTreeOpenedFolderName = { bg = c.vscBack },
		NvimTreeExecFile = {},

		-- Custom
		KlineModeNormal = { fg = c.vscBack, bg = c.vscGreen, bold = true },
		KlineModeVisual = { fg = c.vscBack, bg = c.vscYellowOrange, bold = true },
		KlineModeInsert = { fg = c.vscBack, bg = c.vscBlue, bold = true },
		KlineModeCommand = { fg = c.vscBack, bg = c.vscPink, bold = true },
		KlineModeReplace = { fg = c.vscBack, bg = c.vscRed, bold = true },
		KlineModeOther = { fg = c.vscBack, bg = c.vscRed, bold = true },
		KlineBranch = { fg = c.vscFront, bg = "NONE", bold = true },
		KlineFilename = { link = "Background" },
		KlineCursorIcon = { fg = c.vscBack, bg = c.vscYellowOrange, bold = true },
		KlineCursorText = { fg = c.vscYellowOrange, bg = c.vscBack, bold = true },
	},
})

vim.cmd.colorscheme("vscode")
