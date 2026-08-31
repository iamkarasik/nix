require("nvim-treesitter.configs").setup({
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = { query = "@function.outer", desc = "TS: around function" },
				["if"] = { query = "@function.inner", desc = "TS: inside function" },
				["ac"] = { query = "@class.outer", desc = "TS: around class" },
				["ic"] = { query = "@class.inner", desc = "TS: inside class" },
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
			},
		},
	},
})

require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = false,
	},
	per_filetype = {
		-- ["html"] = {
		--   enable_close = true
		-- }
	},
})
