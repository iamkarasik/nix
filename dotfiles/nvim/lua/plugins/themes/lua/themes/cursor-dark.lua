vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "cursor-dark",
	callback = function()
		local c = require("cursor-dark.palette").base
		local hl = function(group, opts)
			vim.api.nvim_set_hl(0, group, opts)
		end

		hl("Background", { fg = c.fg_dim, bg = c.bg, bold = false, italic = false })
		hl("StatusLine", { link = "Background" })
		hl("StatusLineNC", { link = "Background" })

		hl("KlineModeNormal", { fg = c.bg, bg = c.green, bold = true })
		hl("KlineModeVisual", { fg = c.bg, bg = c.orange, bold = true })
		hl("KlineModeInsert", { fg = c.bg, bg = c.blue, bold = true })
		hl("KlineModeCommand", { fg = c.bg, bg = c.magenta, bold = true })
		hl("KlineModeReplace", { fg = c.bg, bg = c.red, bold = true })
		hl("KlineModeOther", { fg = c.bg, bg = c.red, bold = true })
		hl("KlineBranch", { fg = c.fg, bg = "NONE", bold = true })
		hl("KlineFilename", { link = "Background" })
		hl("KlineCursorIcon", { fg = c.bg, bg = c.orange, bold = true })
		hl("KlineCursorText", { fg = c.orange, bg = c.bg, bold = true })
	end,
})
