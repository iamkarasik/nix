return {
	cmd = {
		"lua-language-server",
	},
	filetypes = {
		"lua",
	},
	root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	},
	settings = {
		Lua = {
			diagnostics = {
				-- disable = { "missing-parameters", "missing-fields" },
				globals = { "vim" },
			},
		},
	},

	single_file_support = true,
}
