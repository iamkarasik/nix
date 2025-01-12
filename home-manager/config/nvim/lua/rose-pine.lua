require('rose-pine').setup({
	variant = 'main', --- @usage 'auto'|'main'|'moon'|'dawn'
	dark_variant = 'main', --- @usage 'main'|'moon'|'dawn'
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = true,
})

-- Set colorscheme after options
vim.cmd('colorscheme rose-pine')
