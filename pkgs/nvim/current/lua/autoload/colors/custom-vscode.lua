local vim = vim

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "custom-vscode"

-- Custom Java
local warnUnderline = "#be9117"
local customYellow = "#ffc66d"
local customGreen = "#3d8f7f"

local colors = {
	inactive = "#666666",
	fg = "#D4D4D4",
	bg = "#1E1E1E",
	bg2 = "#2A2A2A",
	red = "#f44747",
	green = "#4ec9b0",
	blue = "#0a7aca",
	lightblue = "#5cb6f8",
	yellow = "#ffaf00",
	pink = "#ddb6f2",
}

local c = {
	vscNone = "NONE",

	vscTabOther = "#2D2D2D",
	vscTabOutside = "#252526",

	vscLeftDark = "#252526",
	vscLeftMid = "#373737",
	vscLeftLight = "#636369",

	vscPopupFront = "#BBBBBB",
	vscPopupBack = "#272727",
	vscPopupHighlightBlue = "#004b72",
	vscPopupHighlightGray = "#343B41",

	vscSplitLight = "#898989",
	vscSplitDark = "#444444",
	vscSplitThumb = "#424242",

	vscCursorDarkDark = "#222222",
	vscCursorDark = "#51504F",
	vscCursorLight = "#AEAFAD",
	vscSelection = "#264F78",
	vscLineNumber = "#5A5A5A",

	vscDiffRedDark = "#4B1818",
	vscDiffRedLight = "#6F1313",
	vscDiffRedLightLight = "#FB0101",
	vscDiffGreenDark = "#373D29",
	vscDiffGreenLight = "#4B5632",
	vscSearchCurrent = "#515c6a",
	vscSearch = "#613315",

	vscGitAdded = "#81b88b",
	vscGitModified = "#e2c08d",
	vscGitDeleted = "#c74e39",
	vscGitRenamed = "#73c991",
	vscGitUntracked = "#73c991",
	vscGitIgnored = "#8c8c8c",
	vscGitStageModified = "#e2c08d",
	vscGitStageDeleted = "#c74e39",
	vscGitConflicting = "#e4676b",
	vscGitSubmodule = "#8db9e2",

	vscContext = "#404040",
	vscContextCurrent = "#707070",

	vscFoldBackground = "#202d39",

	-- Syntax colors
	vscGray = "#808080",
	vscViolet = "#646695",
	vscBlue = "#569CD6",
	vscAccentBlue = "#4FC1FF",
	vscDarkBlue = "#223E55",
	vscMediumBlue = "#18a2fe",
	vscDisabledBlue = "#729DB3",
	vscLightBlue = "#9CDCFE",
	vscGreen = "#6A9955",
	vscBlueGreen = "#4EC9B0",
	vscLightGreen = "#B5CEA8",
	vscRed = "#F44747",
	vscOrange = "#CE9178",
	vscLightRed = "#D16969",
	vscYellowOrange = "#D7BA7D",
	vscYellow = "#DCDCAA",
	vscDarkYellow = "#FFD602",
	vscPink = "#C586C0",

	-- Low contrast with default background
	vscDimHighlight = "#51504F",
}

vim.g.terminal_color_0 = colors.bg
vim.g.terminal_color_1 = c.vscRed
vim.g.terminal_color_2 = c.vscGreen
vim.g.terminal_color_3 = c.vscYellow
vim.g.terminal_color_4 = c.vscBlue
vim.g.terminal_color_5 = c.vscPink
vim.g.terminal_color_6 = c.vscBlueGreen
vim.g.terminal_color_7 = colors.fg
vim.g.terminal_color_8 = c.vscGray
vim.g.terminal_color_9 = c.vscRed
vim.g.terminal_color_10 = c.vscGreen
vim.g.terminal_color_11 = c.vscYellow
vim.g.terminal_color_12 = c.vscBlue
vim.g.terminal_color_13 = c.vscPink
vim.g.terminal_color_14 = c.vscBlueGreen
vim.g.terminal_color_15 = colors.fg

local opts = {
	transparent = false,
	italic_comments = false,
	underline_links = false,
	color_overrides = {},
	group_overrides = {},
	disable_nvimtree_bg = true,
	terminal_colors = true,
}

local hl = vim.api.nvim_set_hl

local function set_highlights()
	local isDark = vim.o.background == "dark"

	hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
	hl(0, "ColorColumn", { fg = "NONE", bg = "#484848" })
	hl(0, "Cursor", { fg = c.vscCursorDark, bg = c.vscCursorLight })
	hl(0, "CursorLine", { bg = c.vscCursorDarkDark })
	hl(0, "CursorColumn", { fg = "NONE", bg = c.vscCursorDarkDark })
	hl(0, "Directory", { fg = c.vscBlue, bg = colors.bg })
	hl(0, "DiffAdd", { fg = "NONE", bg = c.vscDiffGreenLight })
	hl(0, "DiffChange", { fg = "NONE", bg = c.vscDiffRedDark })
	hl(0, "DiffDelete", { fg = "NONE", bg = c.vscDiffRedLight })
	hl(0, "DiffText", { fg = "NONE", bg = c.vscDiffRedLight })
	hl(0, "EndOfBuffer", { fg = colors.bg, bg = "NONE" })
	hl(0, "ErrorMsg", { fg = c.vscRed, bg = colors.bg })
	hl(0, "VertSplit", { fg = c.vscSplitDark, bg = colors.bg })
	hl(0, "WinSeparator", { link = "VertSplit" })
	hl(0, "Folded", { fg = "NONE", bg = c.vscFoldBackground })
	hl(0, "FoldColumn", { fg = c.vscLineNumber, bg = colors.bg })
	hl(0, "SignColumn", { fg = "NONE", bg = colors.bg })
	hl(0, "IncSearch", { fg = c.vscNone, bg = c.vscSearchCurrent })
	hl(0, "LineNr", { fg = c.vscLineNumber, bg = colors.bg })
	hl(0, "CursorLineNr", { fg = c.vscPopupFront, bg = colors.bg })
	hl(0, "MatchParen", { fg = c.vscNone, bg = c.vscDimHighlight })
	hl(0, "ModeMsg", { fg = colors.fg, bg = c.vscLeftDark })
	hl(0, "MoreMsg", { fg = colors.fg, bg = c.vscLeftDark })
	hl(0, "NonText", { fg = (isDark and c.vscLineNumber or c.vscTabOther), bg = c.vscNone })
	hl(0, "Pmenu", { fg = isDark and c.vscPopupFront or "none", bg = c.vscPopupBack })
	hl(
		0,
		"PmenuSel",
		{ fg = isDark and c.vscPopupFront or "none", bg = isDark and c.vscPopupHighlightBlue or c.vscTabOutside }
	)
	hl(0, "PmenuSbar", { fg = "NONE", bg = c.vscPopupHighlightGray })
	hl(0, "PmenuThumb", { fg = "NONE", bg = c.vscPopupFront })
	hl(0, "Question", { fg = c.vscBlue, bg = colors.bg })
	hl(0, "Search", { fg = c.vscNone, bg = c.vscSearch })
	hl(0, "SpecialKey", { fg = c.vscBlue, bg = c.vscNone })
	hl(0, "StatusLine", { fg = colors.fg, bg = colors.bg })
	hl(0, "StatusLineNC", { fg = colors.fg, bg = colors.bg })
	hl(0, "TabLine", { fg = colors.fg, bg = c.vscTabOther })
	hl(0, "TabLineFill", { fg = colors.fg, bg = c.vscTabOutside })
	hl(0, "TabLineSel", { fg = colors.fg, bg = colors.bg })
	hl(0, "Title", { fg = c.vscNone, bg = c.vscNone, bold = true })
	hl(0, "Visual", { fg = c.vscNone, bg = c.vscSelection })
	hl(0, "VisualNOS", { fg = c.vscNone, bg = c.vscSelection })
	hl(0, "WarningMsg", { fg = c.vscRed, bg = colors.bg, bold = true })
	hl(0, "WildMenu", { fg = c.vscNone, bg = c.vscSelection })
	hl(0, "Comment", { fg = c.vscGreen, bg = "NONE", italic = opts.italic_comments })
	hl(0, "Constant", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "String", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "Character", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "Number", { fg = c.vscLightGreen, bg = "NONE" })
	hl(0, "Boolean", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "Float", { fg = c.vscLightGreen, bg = "NONE" })
	hl(0, "Identifier", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "Function", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "Statement", { fg = c.vscPink, bg = "NONE" })
	hl(0, "Conditional", { fg = c.vscPink, bg = "NONE" })
	hl(0, "Repeat", { fg = c.vscPink, bg = "NONE" })
	hl(0, "Label", { fg = c.vscPink, bg = "NONE" })
	hl(0, "Operator", { fg = colors.fg, bg = "NONE" })
	hl(0, "Keyword", { fg = c.vscPink, bg = "NONE" })
	hl(0, "Exception", { fg = c.vscPink, bg = "NONE" })
	hl(0, "PreProc", { fg = c.vscPink, bg = "NONE" })
	hl(0, "Include", { fg = c.vscPink, bg = "NONE" })
	hl(0, "Define", { fg = c.vscPink, bg = "NONE" })
	hl(0, "Macro", { fg = c.vscPink, bg = "NONE" })
	hl(0, "Type", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "StorageClass", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "Structure", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "Typedef", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "Special", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "SpecialChar", { fg = colors.fg, bg = "NONE" })
	hl(0, "Tag", { fg = colors.fg, bg = "NONE" })
	hl(0, "Delimiter", { fg = colors.fg, bg = "NONE" })
	hl(0, "SpecialComment", { fg = c.vscGreen, bg = "NONE" })
	hl(0, "Debug", { fg = colors.fg, bg = "NONE" })
	hl(0, "Underlined", { fg = c.vscNone, bg = "NONE", underline = true })
	hl(0, "Conceal", { fg = colors.fg, bg = colors.bg })
	hl(0, "Ignore", { fg = colors.fg, bg = "NONE" })
	hl(0, "Error", { fg = c.vscRed, bg = colors.bg, undercurl = true, sp = c.vscRed })
	hl(0, "Todo", { fg = c.vscYellowOrange, bg = colors.bg, bold = true })
	hl(0, "SpellBad", { fg = "NONE", undercurl = true, sp = c.vscRed })
	hl(0, "SpellCap", { fg = "NONE", undercurl = true, sp = c.vscYellow })
	hl(0, "SpellRare", { fg = "NONE", undercurl = true, sp = c.vscViolet })
	hl(0, "SpellLocal", { fg = "NONE", undercurl = true, sp = c.vscBlue })
	hl(0, "Whitespace", { fg = isDark and c.vscLineNumber or c.vscTabOther })
	hl(0, "NormalFloat", { bg = c.vscPopupBack })
	hl(0, "WinBar", { fg = colors.fg, bg = colors.bg, bold = true })
	hl(0, "WinBarNc", { fg = colors.fg, bg = colors.bg })
	hl(0, "QuickFixLine", { bold = true })

	-- Treesitter
	hl(0, "@error", { fg = c.vscRed, bg = "NONE" }) -- Legacy
	hl(0, "@punctuation.bracket", { fg = colors.fg, bg = "NONE" })
	hl(0, "@punctuation.special", { fg = colors.fg, bg = "NONE" })
	hl(0, "@punctuation.delimiter", { fg = colors.fg, bg = "NONE" })
	hl(0, "@comment", { fg = c.vscGreen, bg = "NONE", italic = opts.italic_comments })
	hl(0, "@comment.note", { fg = c.vscBlueGreen, bg = "NONE", bold = true })
	hl(0, "@comment.warning", { fg = c.vscYellowOrange, bg = "NONE", bold = true })
	hl(0, "@comment.error", { fg = c.vscRed, bg = "NONE", bold = true })
	hl(0, "@constant", { fg = customYellow, bg = "NONE" })
	hl(0, "@constant.builtin", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "@constant.macro", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "@string.regexp", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "@string", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "@character", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "@number", { fg = c.vscLightGreen, bg = "NONE" })
	hl(0, "@number.float", { fg = c.vscLightGreen, bg = "NONE" })
	hl(0, "@boolean", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "@annotation", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "@attribute", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "@attribute.builtin", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "@module", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "@function", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "@function.builtin", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "@function.macro", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "@function.method", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "@define", { fg = c.vscPink, bg = "NONE" })
	hl(0, "@variable", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "@variable.builtin", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "@variable.parameter", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "@variable.parameter.reference", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "@variable.member", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "@property", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "@constructor", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "@label", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "@keyword", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "@keyword.conditional", { fg = c.vscPink, bg = "NONE" })
	hl(0, "@keyword.repeat", { fg = c.vscPink, bg = "NONE" })
	hl(0, "@keyword.return", { fg = c.vscPink, bg = "NONE" })
	hl(0, "@keyword.exception", { fg = c.vscPink, bg = "NONE" })
	hl(0, "@keyword.import", { fg = c.vscPink, bg = "NONE" })
	hl(0, "@operator", { fg = colors.fg, bg = "NONE" })
	hl(0, "@type", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "@type.qualifier", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "@structure", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "@tag", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "@tag.builtin", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "@tag.delimiter", { fg = c.vscGray, bg = "NONE" })
	hl(0, "@tag.attribute", { fg = c.vscLightBlue, bg = "NONE" })

	hl(0, "@text", { fg = colors.fg, bg = "NONE" }) -- Legacy
	hl(0, "@markup.strong", { fg = isDark and c.vscBlue or c.vscViolet, bold = true })
	hl(0, "@markup.italic", { fg = colors.fg, bg = "NONE", italic = true })
	hl(0, "@markup.underline", { fg = c.vscYellowOrange, bg = "NONE", underline = true })
	hl(0, "@markup.strikethrough", { fg = colors.fg, bg = "NONE", strikethrough = true })
	hl(0, "@markup.heading", { fg = isDark and c.vscBlue or c.vscYellowOrange, bold = true })
	hl(0, "@markup.raw", { fg = colors.fg, bg = "NONE" })
	hl(0, "@markup.raw.markdown", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "@markup.raw.markdown_inline", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "@markup.link.label", { fg = c.vscLightBlue, bg = "NONE", underline = opts.underline_links })
	hl(0, "@markup.link.url", { fg = colors.fg, bg = "NONE", underline = opts.underline_links })
	hl(0, "@markup.list.checked", { link = "Todo" })
	hl(0, "@markup.list.unchecked", { link = "Todo" })
	hl(0, "@textReference", { fg = isDark and c.vscOrange or c.vscYellowOrange })
	hl(0, "@stringEscape", { fg = isDark and c.vscOrange or c.vscYellowOrange, bold = true })

	hl(0, "@diff.plus", { link = "DiffAdd" })
	hl(0, "@diff.minus", { link = "DiffDelete" })
	hl(0, "@diff.delta", { link = "DiffChange" })

	-- LSP semantic tokens
	hl(0, "@type.builtin", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "@lsp.typemod.type.defaultLibrary", { link = "@type.builtin" })
	hl(0, "@lsp.type.type", { link = "@type" })
	hl(0, "@lsp.type.typeParameter", { link = "@type" })
	hl(0, "@lsp.type.macro", { link = "@constant" })
	hl(0, "@lsp.type.enumMember", { link = "@constant" })
	hl(0, "@lsp.typemod.variable.readonly", { link = "@constant" })
	hl(0, "@lsp.typemod.property.readonly", { link = "@constant" })
	hl(0, "@lsp.typemod.variable.constant", { link = "@constant" })
	hl(0, "@lsp.type.member", { link = "@function" })
	hl(0, "@lsp.type.keyword", { link = "@keyword" })
	hl(0, "@lsp.typemod.keyword.controlFlow", { fg = c.vscPink, bg = "NONE" })
	hl(0, "@lsp.type.comment.c", { fg = c.vscDimHighlight, bg = "NONE" })
	hl(0, "@lsp.type.comment.cpp", { fg = c.vscDimHighlight, bg = "NONE" })
	hl(0, "@event", { link = "Identifier" })
	hl(0, "@interface", { link = "Identifier" })
	hl(0, "@modifier", { link = "Identifier" })
	hl(0, "@regexp", { fg = c.vscRed, bg = "NONE" })
	hl(0, "@decorator", { link = "Identifier" })

	-- Markdown
	hl(0, "markdownBold", { fg = isDark and c.vscBlue or c.vscYellowOrange, bold = true })
	hl(0, "markdownCode", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "markdownRule", { fg = isDark and c.vscBlue or c.vscYellowOrange, bold = true })
	hl(0, "markdownCodeDelimiter", { fg = colors.fg, bg = "NONE" })
	hl(0, "markdownHeadingDelimiter", { fg = isDark and c.vscBlue or c.vscYellowOrange, bg = "NONE" })
	hl(0, "markdownFootnote", { fg = isDark and c.vscOrange or c.vscYellowOrange, bg = "NONE" })
	hl(0, "markdownFootnoteDefinition", { fg = isDark and c.vscOrange or c.vscYellowOrange })
	hl(0, "markdownUrl", { fg = colors.fg, bg = "NONE", underline = true })
	hl(0, "markdownLinkText", { fg = isDark and c.vscOrange or c.vscYellowOrange })
	hl(0, "markdownEscape", { fg = isDark and c.vscOrange or c.vscYellowOrange })

	-- Asciidoc
	hl(0, "asciidocAttributeEntry", { fg = c.vscYellowOrange })
	hl(0, "asciidocAttributeList", { fg = c.vscPink })
	hl(0, "asciidocAttributeRef", { fg = c.vscYellowOrange })
	hl(0, "asciidocHLabel", { fg = c.vscBlue, bold = true })
	hl(0, "asciidocListingBlock", { fg = c.vscOrange })
	hl(0, "asciidocMacroAttributes", { fg = c.vscYellowOrange })
	hl(0, "asciidocOneLineTitle", { fg = c.vscBlue, bold = true })
	hl(0, "asciidocPassthroughBlock", { fg = c.vscBlue })
	hl(0, "asciidocQuotedMonospaced", { fg = c.vscOrange })
	hl(0, "asciidocTriplePlusPassthrough", { fg = c.vscYellow })
	hl(0, "asciidocMacro", { fg = c.vscPink })
	hl(0, "asciidocAdmonition", { fg = c.vscOrange })
	hl(0, "asciidocQuotedEmphasized", { fg = c.vscBlue, italic = true })
	hl(0, "asciidocQuotedEmphasized2", { fg = c.vscBlue, italic = true })
	hl(0, "asciidocQuotedEmphasizedItalic", { fg = c.vscBlue, italic = true })
	hl(0, "asciidocBackslash", { link = "Keyword" })
	hl(0, "asciidocQuotedBold", { link = "markdownBold" })
	hl(0, "asciidocQuotedMonospaced2", { link = "asciidocQuotedMonospaced" })
	hl(0, "asciidocQuotedUnconstrainedBold", { link = "asciidocQuotedBold" })
	hl(0, "asciidocQuotedUnconstrainedEmphasized", { link = "asciidocQuotedEmphasized" })
	hl(0, "asciidocURL", { link = "markdownUrl" })

	-- JSON
	hl(0, "jsonKeyword", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsonEscape", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "jsonNull", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "jsonBoolean", { fg = c.vscBlue, bg = "NONE" })

	-- HTML
	hl(0, "htmlTag", { fg = c.vscGray, bg = "NONE" })
	hl(0, "htmlEndTag", { fg = c.vscGray, bg = "NONE" })
	hl(0, "htmlTagName", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "htmlSpecialTagName", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "htmlArg", { fg = c.vscLightBlue, bg = "NONE" })

	-- PHP
	hl(0, "phpStaticClasses", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "phpMethod", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "phpClass", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "phpFunction", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "phpInclude", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "phpUseClass", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "phpRegion", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "phpMethodsVar", { fg = c.vscLightBlue, bg = "NONE" })

	-- CSS
	hl(0, "cssBraces", { fg = colors.fg, bg = "NONE" })
	hl(0, "cssInclude", { fg = c.vscPink, bg = "NONE" })
	hl(0, "cssTagName", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "cssClassName", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "cssPseudoClass", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "cssPseudoClassId", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "cssPseudoClassLang", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "cssIdentifier", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "cssProp", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "cssDefinition", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "cssAttr", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "cssAttrRegion", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "cssColor", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "cssFunction", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "cssFunctionName", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "cssVendor", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "cssValueNumber", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "cssValueLength", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "cssUnitDecorators", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "cssStyle", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "cssImportant", { fg = c.vscBlue, bg = "NONE" })

	-- JavaScript
	hl(0, "jsVariableDef", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsFuncArgs", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsFuncBlock", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsRegexpString", { fg = c.vscLightRed, bg = "NONE" })
	hl(0, "jsThis", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "jsOperatorKeyword", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "jsDestructuringBlock", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsObjectKey", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsGlobalObjects", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "jsModuleKeyword", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsClassDefinition", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "jsClassKeyword", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "jsExtendsKeyword", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "jsExportDefault", { fg = c.vscPink, bg = "NONE" })
	hl(0, "jsFuncCall", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "jsObjectValue", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsParen", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsObjectProp", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsIfElseBlock", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsParenIfElse", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsSpreadOperator", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "jsSpreadExpression", { fg = c.vscLightBlue, bg = "NONE" })

	-- Typescript
	hl(0, "@type.builtin.typescript", { link = "@type" })
	hl(0, "@type.builtin.tsx", { link = "@type" })
	hl(0, "typescriptLabel", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptExceptions", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptBraces", { fg = colors.fg, bg = "NONE" })
	hl(0, "typescriptEndColons", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptParens", { fg = colors.fg, bg = "NONE" })
	hl(0, "typescriptDocTags", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptDocComment", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "typescriptLogicSymbols", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptImport", { fg = c.vscPink, bg = "NONE" })
	hl(0, "typescriptBOM", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptVariableDeclaration", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptVariable", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptExport", { fg = c.vscPink, bg = "NONE" })
	hl(0, "typescriptAliasDeclaration", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "typescriptAliasKeyword", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptClassName", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "typescriptAccessibilityModifier", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptOperator", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptArrowFunc", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptMethodAccessor", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptMember", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "typescriptTypeReference", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "typescriptTemplateSB", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "typescriptArrowFuncArg", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptParamImpl", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptFuncComma", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptCastKeyword", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptCall", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptCase", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptReserved", { fg = c.vscPink, bg = "NONE" })
	hl(0, "typescriptDefault", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptDecorator", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "typescriptPredefinedType", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "typescriptClassHeritage", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "typescriptClassExtends", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptClassKeyword", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptBlock", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptDOMDocProp", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptTemplateSubstitution", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptClassBlock", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptFuncCallArg", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptIndexExpr", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptConditionalParen", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptArray", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "typescriptES6SetProp", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptObjectLiteral", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptTypeParameter", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "typescriptEnumKeyword", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptEnum", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "typescriptLoopParen", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptParenExp", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptModule", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "typescriptAmbientDeclaration", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptFuncTypeArrow", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptInterfaceHeritage", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "typescriptInterfaceName", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "typescriptInterfaceKeyword", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptInterfaceExtends", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptGlobal", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "typescriptAsyncFuncKeyword", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptFuncKeyword", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "typescriptGlobalMethod", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "typescriptPromiseMethod", { fg = c.vscYellow, bg = "NONE" })

	-- XML
	hl(0, "xmlTag", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "xmlTagName", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "xmlEndTag", { fg = c.vscBlue, bg = "NONE" })

	-- Ruby
	hl(0, "rubyClassNameTag", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "rubyClassName", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "rubyModuleName", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "rubyConstant", { fg = c.vscBlueGreen, bg = "NONE" })

	-- Golang
	hl(0, "goPackage", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "goImport", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "goVar", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "goConst", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "goStatement", { fg = c.vscPink, bg = "NONE" })
	hl(0, "goType", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "goSignedInts", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "goUnsignedInts", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "goFloats", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "goComplexes", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "goBuiltins", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "goBoolean", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "goPredefinedIdentifiers", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "goTodo", { fg = c.vscGreen, bg = "NONE" })
	hl(0, "goDeclaration", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "goDeclType", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "goTypeDecl", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "goTypeName", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "goVarAssign", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "goVarDefs", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "goReceiver", { fg = colors.fg, bg = "NONE" })
	hl(0, "goReceiverType", { fg = colors.fg, bg = "NONE" })
	hl(0, "goFunctionCall", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "goMethodCall", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "goSingleDecl", { fg = c.vscLightBlue, bg = "NONE" })

	-- Python
	hl(0, "pythonStatement", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "pythonOperator", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "pythonException", { fg = c.vscPink, bg = "NONE" })
	hl(0, "pythonExClass", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "pythonBuiltinObj", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "pythonBuiltinType", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "pythonBoolean", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "pythonNone", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "pythonTodo", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "pythonClassVar", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "pythonClassDef", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "@constructor.python", { fg = c.vscBlueGreen, bg = "NONE" })

	-- TeX
	hl(0, "texStatement", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "texBeginEnd", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "texBeginEndName", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "texOption", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "texBeginEndModifier", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "texDocType", { fg = c.vscPink, bg = "NONE" })
	hl(0, "texDocTypeArgs", { fg = c.vscLightBlue, bg = "NONE" })

	-- Git
	hl(0, "gitcommitHeader", { fg = c.vscGray, bg = "NONE" })
	hl(0, "gitcommitOnBranch", { fg = c.vscGray, bg = "NONE" })
	hl(0, "gitcommitBranch", { fg = c.vscPink, bg = "NONE" })
	hl(0, "gitcommitComment", { fg = c.vscGray, bg = "NONE" })
	hl(0, "gitcommitSelectedType", { fg = c.vscGreen, bg = "NONE" })
	hl(0, "gitcommitSelectedFile", { fg = c.vscGreen, bg = "NONE" })
	hl(0, "gitcommitDiscardedType", { fg = c.vscRed, bg = "NONE" })
	hl(0, "gitcommitDiscardedFile", { fg = c.vscRed, bg = "NONE" })
	hl(0, "gitcommitOverflow", { fg = c.vscRed, bg = "NONE" })
	hl(0, "gitcommitSummary", { fg = c.vscPink, bg = "NONE" })
	hl(0, "gitcommitBlank", { fg = c.vscPink, bg = "NONE" })

	-- Lua
	hl(0, "luaFuncCall", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "luaFuncArgName", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "luaFuncKeyword", { fg = c.vscPink, bg = "NONE" })
	hl(0, "luaLocal", { fg = c.vscPink, bg = "NONE" })
	hl(0, "luaBuiltIn", { fg = c.vscBlue, bg = "NONE" })

	-- SH
	hl(0, "shDeref", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "shVariable", { fg = c.vscLightBlue, bg = "NONE" })

	-- SQL
	hl(0, "sqlKeyword", { fg = c.vscPink, bg = "NONE" })
	hl(0, "sqlFunction", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "sqlOperator", { fg = c.vscPink, bg = "NONE" })

	-- YAML
	hl(0, "yamlKey", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "yamlConstant", { fg = c.vscBlue, bg = "NONE" })

	-- Gitgutter
	hl(0, "GitGutterAdd", { fg = c.vscGreen, bg = "NONE" })
	hl(0, "GitGutterChange", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "GitGutterDelete", { fg = c.vscRed, bg = "NONE" })

	-- Git Signs
	hl(0, "GitSignsAdd", { fg = c.vscGreen, bg = "NONE" })
	hl(0, "GitSignsChange", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "GitSignsDelete", { fg = c.vscRed, bg = "NONE" })
	hl(0, "GitSignsAddLn", { fg = colors.bg, bg = c.vscGreen })
	hl(0, "GitSignsChangeLn", { fg = colors.bg, bg = c.vscYellow })
	hl(0, "GitSignsDeleteLn", { fg = colors.bg, bg = c.vscRed })

	-- BarBar
	hl(0, "BufferCurrent", { fg = colors.fg, bg = colors.bg })
	hl(0, "BufferCurrentIndex", { fg = colors.fg, bg = colors.bg })
	hl(0, "BufferCurrentMod", { fg = c.vscYellowOrange, bg = colors.bg })
	hl(0, "BufferCurrentSign", { fg = colors.fg, bg = colors.bg })
	hl(0, "BufferCurrentTarget", { fg = c.vscRed, bg = colors.bg })
	hl(0, "BufferVisible", { fg = c.vscGray, bg = colors.bg })
	hl(0, "BufferVisibleIndex", { fg = c.vscGray, bg = colors.bg })
	hl(0, "BufferVisibleMod", { fg = c.vscYellowOrange, bg = colors.bg })
	hl(0, "BufferVisibleSign", { fg = c.vscGray, bg = colors.bg })
	hl(0, "BufferVisibleTarget", { fg = c.vscRed, bg = colors.bg })
	hl(0, "BufferInactive", { fg = c.vscGray, bg = c.vscTabOther })
	hl(0, "BufferInactiveIndex", { fg = c.vscGray, bg = c.vscTabOther })
	hl(0, "BufferInactiveMod", { fg = c.vscYellowOrange, bg = c.vscTabOther })
	hl(0, "BufferInactiveSign", { fg = c.vscGray, bg = c.vscTabOther })
	hl(0, "BufferInactiveTarget", { fg = c.vscRed, bg = c.vscTabOther })
	hl(0, "BufferTabpage", { fg = colors.fg, bg = c.vscTabOther })
	hl(0, "BufferTabpageFill", { fg = colors.fg, bg = c.vscTabOther })
	hl(0, "BufferTabpages", { fg = colors.fg, bg = c.vscTabOther })
	hl(0, "BufferTabpagesFill", { fg = colors.fg, bg = c.vscTabOther })

	-- IndentBlankLine
	hl(0, "IblIndent", { fg = "#484848", bg = "NONE", nocombine = true })
	hl(0, "IblScope", { fg = "#484848", bg = "NONE", nocombine = true })

	-- Neotest
	hl(0, "NeotestAdapterName", { fg = colors.fg, bold = true })
	hl(0, "NeotestDir", { fg = c.vscBlue })
	hl(0, "NeotestExpandMarker", { fg = c.vscDimHighlight })
	hl(0, "NeotestFailed", { fg = c.vscRed })
	hl(0, "NeotestFile", { fg = c.vscBlue })
	hl(0, "NeotestFocused", { bold = true })
	hl(0, "NeotestIndent", { fg = c.vscDimHighlight })
	hl(0, "NeotestMarked", { fg = c.vscYellowOrange, bold = true })
	hl(0, "NeotestNamespace", { fg = c.vscPink })
	hl(0, "NeotestPassed", { fg = c.vscBlueGreen })
	hl(0, "NeotestRunning", { fg = c.vscDarkYellow })
	hl(0, "NeotestSkipped", { fg = c.vscBlue })
	hl(0, "NeotestTarget", { fg = c.vscLightRed })
	hl(0, "NeotestWatching", { fg = c.vscDarkYellow })
	hl(0, "NeotestWinSelect", { fg = c.vscBlue, bold = true })

	-- LSP
	hl(0, "DiagnosticOk", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "DiagnosticError", { fg = c.vscRed, bg = "NONE" })
	hl(0, "DiagnosticWarn", { fg = c.vscYellow, bg = "NONE" })
	hl(0, "DiagnosticInfo", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "DiagnosticHint", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "DiagnosticUnnecessary", { fg = c.vscDisabledBlue, bg = "NONE" })
	hl(0, "DiagnosticUnderlineError", { fg = "NONE", bg = "NONE", undercurl = true, sp = c.vscRed })
	hl(0, "DiagnosticUnderlineWarn", { fg = "NONE", bg = "NONE", undercurl = true, sp = c.vscYellow })
	hl(0, "DiagnosticUnderlineInfo", { fg = "NONE", bg = "NONE", undercurl = true, sp = c.vscBlue })
	hl(0, "DiagnosticUnderlineHint", { fg = "NONE", bg = "NONE", undercurl = true, sp = c.vscBlue })
	hl(0, "LspReferenceText", { fg = "NONE", bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
	hl(0, "LspReferenceRead", { fg = "NONE", bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
	hl(0, "LspReferenceWrite", { fg = "NONE", bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })

	-- Nvim compe
	hl(0, "CmpItemKindVariable", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "CmpItemKindInterface", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "CmpItemKindText", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "CmpItemKindFunction", { fg = c.vscPink, bg = "NONE" })
	hl(0, "CmpItemKindMethod", { fg = c.vscPink, bg = "NONE" })
	hl(0, "CmpItemKindKeyword", { fg = colors.fg, bg = "NONE" })
	hl(0, "CmpItemKindProperty", { fg = colors.fg, bg = "NONE" })
	hl(0, "CmpItemKindUnit", { fg = colors.fg, bg = "NONE" })
	hl(0, "CmpItemKindConstructor", { fg = c.vscUiOrange, bg = "NONE" })
	hl(0, "CmpItemMenu", { fg = c.vscPopupFront, bg = "NONE" })
	hl(0, "CmpItemAbbr", { fg = colors.fg, bg = "NONE" })
	hl(0, "CmpItemAbbrDeprecated", { fg = c.vscCursorDark, bg = c.vscPopupBack, strikethrough = true })
	hl(0, "CmpItemAbbrMatch", { fg = isDark and c.vscMediumBlue or c.vscDarkBlue, bg = "NONE", bold = true })
	hl(0, "CmpItemAbbrMatchFuzzy", { fg = isDark and c.vscMediumBlue or c.vscDarkBlue, bg = "NONE", bold = true })

	-- Blink
	hl(0, "BlinkCmpMenu", { link = "Pmenu" })
	hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
	hl(0, "BlinkCmpMenuSelection", { link = "PmenuSel" })
	hl(0, "BlinkCmpScrollBarThumb", { link = "PmenuThumb" })
	hl(0, "BlinkCmpScrollBarGutter", { link = "PmenuSbar" })
	hl(0, "BlinkCmpLabel", { fg = c.vscFront, bg = "NONE" })
	hl(0, "BlinkCmpLabelMatch", { fg = isDark and c.vscMediumBlue or c.vscDarkBlue, bg = "NONE", bold = true })
	hl(0, "BlinkCmpLabelDetail", { fg = c.vscPopupFront, bg = "NONE" })
	hl(0, "BlinkCmpLabelDescription", { fg = c.vscPopupFront, bg = "NONE" })
	hl(0, "BlinkCmpKind", { fg = c.vscPopupFront, bg = "NONE" })
	hl(0, "BlinkCmpSource", { fg = c.vscPopupFront, bg = "NONE" })
	hl(0, "BlinkCmpGhostText", { fg = c.vscContextCurrent })
	hl(0, "BlinkCmpDoc", { link = "NormalFloat" })
	hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
	hl(0, "BlinkCmpDocSeparator", { link = "NormalFloat" })
	hl(0, "BlinkCmpDocCursorLine", { link = "Visual" })
	hl(0, "BlinkCmpSignatureHelp", { link = "NormalFloat" })
	hl(0, "BlinkCmpSignatureHelpBorder", { link = "NormalFloat" })
	hl(0, "BlinkCmpSignatureHelpActiveParameter", { link = "LspSignatureActiveParameter" })

	hl(0, "BlinkCmpKindText", { fg = c.vscPopupFront, bg = "NONE" })
	hl(0, "BlinkCmpKindMethod", { fg = c.vscPink, bg = "NONE" })
	hl(0, "BlinkCmpKindFunction", { fg = c.vscPink, bg = "NONE" })
	hl(0, "BlinkCmpKindConstructor", { fg = c.vscUiOrange, bg = "NONE" })
	hl(0, "BlinkCmpKindField", { link = "@variable.member" })
	hl(0, "BlinkCmpKindVariable", { link = "@variable.member" })
	hl(0, "BlinkCmpKindClass", { link = "BlinkCmpKindConstructor" })
	hl(0, "BlinkCmpKindInterface", { fg = c.vscLightBlue, bg = "NONE" })
	hl(0, "BlinkCmpKindModule", { link = "BlinkCmpKindClass" })
	hl(0, "BlinkCmpKindProperty", { link = "BlinkCmpKindField" })
	hl(0, "BlinkCmpKindUnit", { link = "BlinkCmpKindField" })
	hl(0, "BlinkCmpKindValue", { link = "@variable.member" })
	hl(0, "BlinkCmpKindEnum", { link = "BlinkCmpKindConstructor" })
	hl(0, "BlinkCmpKindKeyword", { fg = c.vscDarkYellow, bg = "NONE" })
	hl(0, "BlinkCmpKindSnippet", { fg = c.vscDarkYellow, bg = "NONE" })
	hl(0, "BlinkCmpKindColor", { link = "cssColor" })
	hl(0, "BlinkCmpKindFile", { link = "@text.uri" })
	hl(0, "BlinkCmpKindReference", { link = "@variable.parameter.reference" })
	hl(0, "BlinkCmpKindFolder", { link = "NeotestDir" })
	hl(0, "BlinkCmpKindEnumMember", { link = "@variable.member" })
	hl(0, "BlinkCmpKindConstant", { link = "@constant" })
	hl(0, "BlinkCmpKindStruct", { link = "@structure" })
	hl(0, "BlinkCmpKindEvent", { fg = c.vscDarkYellow, bg = "NONE" })
	hl(0, "BlinkCmpKindOperator", { link = "@operator" })
	hl(0, "BlinkCmpKindTypeParameter", { link = "@variable.parameter" })
	hl(0, "BlinkCmpKindCopilot", { fg = c.vscBlueGreen })

	-- HiPhish/rainbow-delimiters.nvim
	hl(0, "RainbowDelimiterRed", { fg = c.vscPink, bg = "NONE" })
	hl(0, "RainbowDelimiterOrange", { fg = c.vscOrange, bg = "NONE" })
	hl(0, "RainbowDelimiterYellow", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "RainbowDelimiterGreen", { fg = c.vscGreen, bg = "NONE" })
	hl(0, "RainbowDelimiterCyan", { fg = c.vscBlueGreen, bg = "NONE" })
	hl(0, "RainbowDelimiterBlue", { fg = c.vscMediumBlue, bg = "NONE" })
	hl(0, "RainbowDelimiterViolet", { fg = c.vscViolet, bg = "NONE" })

	-- rcarriga/nvim-dap-ui
	-- Source: https://github.com/rcarriga/nvim-dap-ui/blob/master/lua/dapui/config/highlights.lua
	hl(0, "DapUIBreakpointsCurrentLine", { fg = c.vscBlueGreen, bold = true })
	hl(0, "DapUIBreakpointsDisabledLine", { fg = c.vscDimHighlight })
	hl(0, "DapUIBreakpointsInfo", { fg = c.vscBlueGreen })
	hl(0, "DapUIBreakpointsLine", { fg = c.vscPink })
	hl(0, "DapUIBreakpointsPath", { fg = c.vscPink })
	hl(0, "DapUICurrentFrameName", { fg = c.vscBlueGreen, bold = true })
	hl(0, "DapUIDecoration", { fg = c.vscPink })
	hl(0, "DapUIFloatBorder", { fg = c.vscPink })
	hl(0, "DapUILineNumber", { fg = c.vscPink })
	hl(0, "DapUIModifiedValue", { fg = c.vscPink, bold = true })
	hl(0, "DapUIPlayPause", { fg = c.vscBlueGreen })
	hl(0, "DapUIPlayPauseNC", { fg = c.vscBlueGreen })
	hl(0, "DapUIRestart", { fg = c.vscBlueGreen })
	hl(0, "DapUIRestartNC", { fg = c.vscBlueGreen })
	hl(0, "DapUIScope", { fg = c.vscPink })
	hl(0, "DapUISource", { fg = c.vscMediumBlue })
	hl(0, "DapUIStepBack", { fg = c.vscPink })
	hl(0, "DapUIStepBackNC", { fg = c.vscPink })
	hl(0, "DapUIStepInto", { fg = c.vscPink })
	hl(0, "DapUIStepIntoNC", { fg = c.vscPink })
	hl(0, "DapUIStepOut", { fg = c.vscPink })
	hl(0, "DapUIStepOutNC", { fg = c.vscPink })
	hl(0, "DapUIStepOver", { fg = c.vscPink })
	hl(0, "DapUIStepOverNC", { fg = c.vscPink })
	hl(0, "DapUIStop", { fg = c.vscRed })
	hl(0, "DapUIStopNC", { fg = c.vscRed })
	hl(0, "DapUIStoppedThread", { fg = c.vscPink })
	hl(0, "DapUIThread", { fg = c.vscBlueGreen })
	hl(0, "DapUIType", { fg = c.vscPink })
	hl(0, "DapUIUnavailable", { fg = c.vscDimHighlight })
	hl(0, "DapUIUnavailableNC", { fg = c.vscDimHighlight })
	hl(0, "DapUIWatchesEmpty", { fg = c.vscDimHighlight })
	hl(0, "DapUIWatchesError", { fg = c.vscRed })
	hl(0, "DapUIWatchesValue", { fg = c.vscBlueGreen })
	hl(0, "DapUIWinSelect", { fg = c.vscPink, bold = true })

	-- Dashboard
	hl(0, "DashboardHeader", { fg = c.vscBlue, bg = "NONE" })
	hl(0, "DashboardDesc", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "DashboardIcon", { fg = c.vscYellowOrange, bg = "NONE" })
	hl(0, "DashboardShortCut", { fg = c.vscPink, bg = "NONE" })
	hl(0, "DashboardKey", { fg = c.vscWhite, bg = "NONE" })
	hl(0, "DashboardFooter", { fg = c.vscBlue, bg = "NONE", italic = true })

	-- Illuminate
	hl(0, "illuminatedWord", { bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
	hl(0, "illuminatedCurWord", { bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
	hl(0, "IlluminatedWordText", { bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
	hl(0, "IlluminatedWordRead", { bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
	hl(0, "IlluminatedWordWrite", { bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })

	hl(0, "LspFloatWinNormal", { fg = colors.fg, bg = "NONE" })
	hl(0, "LspFloatWinBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspInfoBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaHoverBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaSignatureHelpBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaCodeActionBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaDefPreviewBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspLinesDiagBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaRenameBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaBorderTitle", { fg = c.vscCursorDark, bg = "NONE" })
	hl(0, "LSPSagaDiagnosticTruncateLine", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaDiagnosticBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaDiagnosticBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaShTruncateLine", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaShTruncateLine", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaDocTruncateLine", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaRenameBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "LspSagaLspFinderBorder", { fg = c.vscLineNumber, bg = "NONE" })

	hl(0, "TelescopePromptBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "TelescopeResultsBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "TelescopePreviewBorder", { fg = c.vscLineNumber, bg = "NONE" })
	hl(0, "TelescopeNormal", { fg = colors.fg, bg = "NONE" })
	hl(0, "TelescopeSelection", { fg = colors.fg, bg = c.vscPopupHighlightBlue })
	hl(0, "TelescopeSelectionCaret", { fg = colors.red, bg = c.vscPopupHighlightBlue })
	hl(0, "TelescopeMultiSelection", { fg = colors.fg, bg = c.vscPopupHighlightBlue })
	hl(0, "TelescopeMatching", { fg = c.vscMediumBlue, bg = "NONE", bold = true })
	hl(0, "TelescopePromptPrefix", { fg = colors.red, bg = "NONE" })

	hl(0, "TelescopeTitle", { fg = colors.bg, bg = colors.red, bold = true })
	hl(0, "TelescopePromptTitle", { fg = colors.bg, bg = colors.red, bold = true })
	hl(0, "TelescopePreviewTitle", { fg = colors.bg, bg = colors.blue, bold = true })
	hl(0, "TelescopeResultsTitle", { fg = colors.bg, bg = colors.green, bold = true })

	hl(0, "NeoTreeFloatTitle", { fg = colors.bg, bg = colors.red, bold = true })

	-- Debugging
	hl(0, "debugPC", { bg = "#4C4C19" })

	-- symbols-outline
	-- white fg and lualine blue bg
	hl(0, "FocusedSymbol", { fg = "#ffffff", bg = c.vscUiBlue })
	hl(0, "SymbolsOutlineConnector", { fg = c.vscLineNumber, bg = "NONE" })
end

local function link_highlight()
	-- Legacy groups for official git.vim and diff.vim syntax
	hl(0, "diffAdded", { link = "DiffAdd" })
	hl(0, "diffChanged", { link = "DiffChange" })
	hl(0, "diffRemoved", { link = "DiffDelete" })
	-- Legacy groups for treesitter
	hl(0, "@parameter", { link = "@variable.parameter" })
	hl(0, "@field", { link = "@variable.member" })
	hl(0, "@string.regex", { link = "@string.regexp" })
	hl(0, "@float", { link = "@number.float" })
	hl(0, "@namespace", { link = "@module" })
	hl(0, "@method", { link = "@function.method" })
	hl(0, "@field", { link = "@variable.member" })
	hl(0, "@conditional", { link = "@keyword.conditional" })
	hl(0, "@repeat", { link = "@keyword.repeat" })
	hl(0, "@exception", { link = "@keyword.exception" })
	hl(0, "@storageclass", { link = "@keyword.storage" })
	hl(0, "@include", { link = "@keyword.import" })
	hl(0, "@text.strong", { link = "@markup.strong" })
	hl(0, "@text.underline", { link = "@markup.underline" })
	hl(0, "@text.emphasis", { link = "@markup.italic" })
	hl(0, "@text.strike", { link = "@markup.strikethrough" })
	hl(0, "@text.title", { link = "@markup.heading" })
	hl(0, "@text.uri", { link = "@markup.link.url" })
	hl(0, "@text.literal", { link = "@markup.raw" })
	hl(0, "@text.note", { link = "@comment.note" })
	hl(0, "@text.warning", { link = "@comment.warning" })
	hl(0, "@text.danger", { link = "@comment.error" })
	hl(0, "@text.diff.add", { link = "@diff.plus" })
	hl(0, "@text.diff.delete", { link = "@diff.minus" })
	-- Nvim compe
	hl(0, "CompeDocumentation", { link = "Pmenu" })
	hl(0, "CompeDocumentationBorder", { link = "Pmenu" })
	hl(0, "CmpItemKind", { link = "Pmenu" })
	hl(0, "CmpItemKindClass", { link = "CmpItemKindConstructor" })
	hl(0, "CmpItemKindModule", { link = "CmpItemKindKeyword" })
	hl(0, "CmpItemKindOperator", { link = "@operator" })
	hl(0, "CmpItemKindReference", { link = "@variable.parameter.reference" })
	hl(0, "CmpItemKindValue", { link = "@variable.member" })
	hl(0, "CmpItemKindField", { link = "@variable.member" })
	hl(0, "CmpItemKindEnum", { link = "@variable.member" })
	hl(0, "CmpItemKindSnippet", { link = "@text" })
	hl(0, "CmpItemKindColor", { link = "cssColor" })
	hl(0, "CmpItemKindFile", { link = "@text.uri" })
	hl(0, "CmpItemKindFolder", { link = "@text.uri" })
	hl(0, "CmpItemKindEvent", { link = "@constant" })
	hl(0, "CmpItemKindEnumMember", { link = "@variable.member" })
	hl(0, "CmpItemKindConstant", { link = "@constant" })
	hl(0, "CmpItemKindStruct", { link = "@structure" })
	hl(0, "CmpItemKindTypeParameter", { link = "@variable.parameter" })

	-- Custom status line
	hl(0, "LualineTextModeNormal", { fg = colors.blue, bg = colors.bg2, bold = true })
	hl(0, "LualineTextModeVisual", { fg = colors.yellow, bg = colors.bg2, bold = true })
	hl(0, "LualineTextModeReplace", { fg = colors.red, bg = colors.bg2, bold = true })
	hl(0, "LualineTextModeInsert", { fg = colors.green, bg = colors.bg2, bold = true })
	hl(0, "LualineTextModeCommand", { fg = colors.pink, bg = colors.bg2, bold = true })
	hl(0, "LualineTextModeUnknown", { fg = colors.lightblue, bg = colors.bg2, bold = true })

	hl(0, "LualineIconModeNormal", { fg = colors.bg, bg = colors.blue, bold = true })
	hl(0, "LualineIconModeVisual", { fg = colors.bg, bg = colors.yellow, bold = true })
	hl(0, "LualineIconModeReplace", { fg = colors.bg, bg = colors.red, bold = true })
	hl(0, "LualineIconModeInsert", { fg = colors.bg, bg = colors.green, bold = true })
	hl(0, "LualineIconModeCommand", { fg = colors.bg, bg = colors.pink, bold = true })
	hl(0, "LualineIconModeUnknown", { fg = colors.bg, bg = colors.lightblue, bold = true })

	hl(0, "LualineIconLsp", { fg = colors.bg, bg = colors.green, bold = true })
	hl(0, "LualineTextLsp", { fg = colors.green, bg = colors.bg2, bold = true })

	hl(0, "LualineIconProjectRoot", { fg = colors.bg, bg = colors.pink, bold = true })
	hl(0, "LualineTextProjectRoot", { fg = colors.pink, bg = colors.bg2, bold = true })

	hl(0, "LualineIconCursor", { fg = colors.bg, bg = colors.yellow, bold = true })
	hl(0, "LualineTextCursor", { fg = colors.yellow, bg = colors.bg2, bold = true })

	hl(0, "LualineIconGitBranch", { fg = colors.bg, bg = colors.red, bold = true })
	hl(0, "LualineTextGitBranch", { fg = colors.red, bg = colors.bg2, bold = true })

	hl(0, "MiniCursorword", { bg = "#303030" })
	hl(0, "MiniCursorwordCurrent", { bg = "#303030" })

	vim.api.nvim_set_hl(
		0,
		"DiagnosticUnnecessary",
		{ fg = c.vscGray, bg = "NONE", undercurl = true, sp = warnUnderline }
	)
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = c.vscRed, bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"DiagnosticUnderlineWarn",
		{ fg = "NONE", bg = "NONE", undercurl = true, sp = warnUnderline }
	)

	vim.api.nvim_set_hl(0, "@constant.java", { fg = customYellow })
	vim.api.nvim_set_hl(0, "@lsp.typemod.property.static.java", { fg = customYellow })
	vim.api.nvim_set_hl(0, "@variable.parameter.java", { fg = c.vscYellow })
	vim.api.nvim_set_hl(0, "@lsp.type.parameter.java", { fg = c.vscYellow })

	vim.api.nvim_set_hl(0, "@lsp.typemod.property.readonly.java", { link = "@lsp" })
	vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.java", { link = "@lsp" })

	vim.api.nvim_set_hl(0, "@lsp.typemod.method.static.java", { fg = c.vscFront })

	vim.api.nvim_set_hl(0, "@keyword.conditional.java", { fg = c.vscBlue })
	vim.api.nvim_set_hl(0, "@keyword.return.java", { fg = c.vscBlue })
	vim.api.nvim_set_hl(0, "@keyword.import.java", { fg = c.vscBlue })
	vim.api.nvim_set_hl(0, "@keyword.exception.java", { fg = c.vscBlue })

	vim.api.nvim_set_hl(0, "@lsp.typemod.annotation.public.java", { fg = c.vscBlueGreen })

	vim.api.nvim_set_hl(0, "@lsp.typemod.interface.public.java", { fg = customGreen })
end

set_highlights()
link_highlight()
