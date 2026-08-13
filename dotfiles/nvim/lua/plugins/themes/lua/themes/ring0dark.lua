vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "ring0dark",
	callback = function()
		local c = require("ring0dark.palette")
		local hl = function(group, opts)
			vim.api.nvim_set_hl(0, group, opts)
		end

		hl("Background", { fg = c.fg, bg = c.bg, bold = false, italic = false })
		hl("StatusLine", { link = "Background" })
		hl("StatusLineNC", { link = "Background" })

		hl("Directory", { fg = c.brown, bg = "NONE", bold = false })

		hl("NvimTreeNormal", { link = "Normal" })
		hl("NvimTreeTitle", { link = "Background" })
		hl("NvimTreeIndentMarker", { fg = c.gray, bg = "NONE" })
		hl("NvimTreeCursorLine", { link = "CursorLine" })
		hl("NvimTreeFolderName", { link = "Directory" })
		hl("NvimTreeFolderIcon", { link = "Directory" })
		hl("NvimTreeClosedFolderIcon", { link = "Directory" })
		hl("NvimTreeOpenedFolderIcon", { fg = c.yellow, bg = "NONE" })
		hl("NvimTreeOpenedFolderName", { fg = c.yellow, bg = "NONE", bold = true })
		hl("NvimTreeEmptyFolderName", { fg = c.gray, bg = "NONE" })
		hl("NvimTreeRootFolder", { fg = c.yellow, bg = "NONE", bold = true })
		hl("NvimTreeSymlinkFolderName", { fg = c.cyan, bg = "NONE" })
		hl("NvimTreeModifiedIcon", { fg = c.orange, bg = "NONE" })
		hl("NvimTreeGitFileNewHL", { link = "NvimTreeModifiedIcon" })
		hl("NvimTreeGitFileStagedHL", { link = "NvimTreeModifiedIcon" })
		hl("NvimTreeGitFileDirtyHL", { link = "NvimTreeModifiedIcon" })
		hl("NvimTreeExecFile", {})

		hl("KlineModeNormal", { fg = c.bg, bg = c.green, bold = true })
		hl("KlineModeVisual", { fg = c.bg, bg = c.orange, bold = true })
		hl("KlineModeInsert", { fg = c.bg, bg = c.blue, bold = true })
		hl("KlineModeCommand", { fg = c.bg, bg = c.purple, bold = true })
		hl("KlineModeReplace", { fg = c.bg, bg = c.red, bold = true })
		hl("KlineModeOther", { fg = c.bg, bg = c.red, bold = true })
		hl("KlineBranch", { fg = c.fg, bg = "NONE", bold = true })
		hl("KlineFilename", { link = "Background" })
		hl("KlineCursorIcon", { fg = c.bg, bg = c.orange, bold = true })
		hl("KlineCursorText", { fg = c.orange, bg = c.bg, bold = true })
	end,
})
