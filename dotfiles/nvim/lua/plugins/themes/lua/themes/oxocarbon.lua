vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "oxocarbon",
	callback = function()
		local c = require("oxocarbon").oxocarbon
		local hl = function(group, opts)
			vim.api.nvim_set_hl(0, group, opts)
		end

		hl("Background", { fg = c.base03, bg = c.base00, bold = false, italic = false })
		hl("StatusLine", { link = "Background" })
		hl("StatusLineNC", { link = "Background" })

		hl("KlineModeNormal", { fg = c.base00, bg = c.base13, bold = true })
		hl("KlineModeVisual", { fg = c.base00, bg = c.base12, bold = true })
		hl("KlineModeInsert", { fg = c.base00, bg = c.base09, bold = true })
		hl("KlineModeCommand", { fg = c.base00, bg = c.base14, bold = true })
		hl("KlineModeReplace", { fg = c.base00, bg = c.base10, bold = true })
		hl("KlineModeOther", { fg = c.base00, bg = c.base10, bold = true })
		hl("KlineBranch", { fg = c.base04, bg = "NONE", bold = true })
		hl("KlineFilename", { link = "Background" })
		hl("KlineCursorIcon", { fg = c.base00, bg = c.base12, bold = true })
		hl("KlineCursorText", { fg = c.base12, bg = c.base00, bold = true })
	end,
})
