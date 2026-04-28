require("colorizer").setup({
	filetypes = { "lua", "css", "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	user_default_options = {
		names = true, -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
		names_opts = { -- options for mutating/filtering names.
			lowercase = true, -- name:lower(), highlight `blue` and `red`
			camelcase = true, -- name, highlight `Blue` and `Red`
			uppercase = false, -- name:upper(), highlight `BLUE` and `RED`
			strip_digits = false, -- ignore names with digits,
		},
		css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		-- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
		tailwind = true, -- Enable tailwind colors
		tailwind_opts = { -- Options for highlighting tailwind names
			update_names = false, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
		},
		-- parsers can contain values used in `user_default_options`
		sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
		-- Highlighting mode.  'background'|'foreground'|'virtualtext'
		mode = "virtualtext", -- Set the display mode
		-- Virtualtext character to use
		virtualtext = "■",
		-- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
		virtualtext_inline = true,
		-- Virtualtext highlight mode: 'background'|'foreground'
		virtualtext_mode = "foreground",
		-- update color values even if buffer is not focused
		-- example use: cmp_menu, cmp_docs
		always_update = false,
		-- hooks to invert control of colorizer
		hooks = {
			disable_line_highlight = false,
		},
	},
})
