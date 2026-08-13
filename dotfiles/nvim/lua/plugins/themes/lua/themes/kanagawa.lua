require("kanagawa").setup({
	overrides = function(colors)
		local t = colors.theme
		return {
			Background = { fg = t.ui.fg_dim, bg = t.ui.bg, bold = false, italic = false },
			StatusLine = { link = "Background" },
			StatusLineNC = { link = "Background" },

			KlineModeNormal = { fg = t.ui.bg, bg = t.syn.string, bold = true },
			KlineModeVisual = { fg = t.ui.bg, bg = t.syn.constant, bold = true },
			KlineModeInsert = { fg = t.ui.bg, bg = t.syn.fun, bold = true },
			KlineModeCommand = { fg = t.ui.bg, bg = t.syn.keyword, bold = true },
			KlineModeReplace = { fg = t.ui.bg, bg = t.diag.error, bold = true },
			KlineModeOther = { fg = t.ui.bg, bg = t.diag.error, bold = true },
			KlineBranch = { fg = t.ui.fg, bg = "NONE", bold = true },
			KlineFilename = { link = "Background" },
			KlineCursorIcon = { fg = t.ui.bg, bg = t.syn.constant, bold = true },
			KlineCursorText = { fg = t.syn.constant, bg = t.ui.bg, bold = true },
		}
	end,
})
