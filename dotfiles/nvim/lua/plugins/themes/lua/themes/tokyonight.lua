require("tokyonight").setup({
	on_highlights = function(hl, c)
		hl.StatusLine = { bg = c.bg }
		hl.KlineModeNormal = { fg = c.bg, bg = c.green, bold = true }
		hl.KlineModeVisual = { fg = c.bg, bg = c.orange, bold = true }
		hl.KlineModeInsert = { fg = c.bg, bg = c.blue, bold = true }
		hl.KlineModeCommand = { fg = c.bg, bg = c.purple, bold = true }
		hl.KlineModeReplace = { fg = c.bg, bg = c.red, bold = true }
		hl.KlineModeOther = { fg = c.bg, bg = c.red, bold = true }
		hl.KlineBranch = { fg = c.fg, bg = "NONE", bold = true }
		hl.KlineFilename = { link = "Background" }
		hl.KlineCursorIcon = { fg = c.bg, bg = c.orange, bold = true }
		hl.KlineCursorText = { fg = c.orange, bg = c.bg, bold = true }
	end,
})

-- Background = { fg = c.vscGray, bg = .bg, bold = false, italic = false },
-- StatusLine = { link = "Background" },
-- StatusLineNC = { link = "Background" },
-- WinSeparator = { fg = .bg, bg = "NONE", bold = false, italic = false },
-- VertLine = { fg = c.vscLineNumber, bg = .bg },

-- BufferLine
-- BufferLineFill = { link = "Background" },
-- BufferLineIndicatorSelected = { link = "Background" },
-- BufferLineIndicatorVisible = { link = "Background" },
-- BufferLineBufferSelected = { fg = c.vscFront, bg = .bg, bold = true, italic = false },
-- BufferLineBufferVisible = { fg = c.vscFront, bg = .bg, bold = false, italic = false },
-- BufferLineCloseButtonSelected = { fg = c.vscFront, bg = .bg, bold = true, italic = false },
-- BufferLineCloseButtonVisible = { fg = c.vscFront, bg = .bg, bold = false, italic = false },
-- BufferLineCloseDuplicateSelected = { fg = c.vscFront, bg = .bg, bold = true, italic = false },
-- BufferLineCloseDuplicateVisible = { fg = c.vscFront, bg = .bg, bold = false, italic = false },
--
-- BufferLineModified = { fg = c.vscYellowOrange, bg = .bg },
-- BufferLineModifiedSelected = { fg = c.vscYellowOrange, bg = .bg },
-- BufferLineModifiedVisible = { fg = c.vscYellowOrange, bg = .bg },

-- Custom
