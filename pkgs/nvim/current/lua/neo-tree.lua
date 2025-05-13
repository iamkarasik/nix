require("neo-tree").setup({
	close_if_last_window = true,
	popup_border_style = "single",
	enable_git_status = true,
	enable_modified_markers = false,
	enable_diagnostics = false,
	sort_case_insensitive = true,
	default_component_configs = {
		indent = {
			with_markers = false,
			with_expanders = true,
		},
		icon = {
			folder_closed = " ",
			folder_open = "",
			folder_empty = "",
			folder_empty_open = "",
		},
		git_status = {
			symbols = {
				added = "",
				deleted = "",
				modified = "",
				renamed = "",
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
		file_size = {
			enabled = false,
		},
		last_modified = {
			enabled = false,
		},
		type = {
			enabled = false,
		},
	},
	window = {
		position = "float",
		width = 35,
	},
	filesystem = {
		use_libuv_file_watcher = true,
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_name = {
				"node_modules",
			},
			never_show = {
				".DS_Store",
				"thumbs.db",
			},
		},
	},
	source_selector = {
		winbar = false,
	},
	event_handlers = {
		{
			event = "neo_tree_window_after_open",
			handler = function(args)
				if args.position == "left" or args.position == "right" then
					vim.cmd("wincmd =")
				end
			end,
		},
		{
			event = "neo_tree_window_after_close",
			handler = function(args)
				if args.position == "left" or args.position == "right" then
					vim.cmd("wincmd =")
				end
			end,
		},
	},
})

vim.keymap.set("n", "<leader><Tab>", "<Esc>:Neotree toggle position=left<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-e>", "<Esc>:Neotree toggle position=float<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ee", ":Neotree toggle position=float<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ec", ":Neotree reveal position=float<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>eg", ":Neotree git_status position=float<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>eb", ":Neotree buffers position=float<CR>", { noremap = true, silent = true })

vim.api.nvim_set_hl(0, "NeoTreeRootName", { italic = false })
