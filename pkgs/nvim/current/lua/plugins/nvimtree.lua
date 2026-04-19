local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	api.events.subscribe(api.events.Event.FileCreated, function(file)
		vim.cmd("edit " .. vim.fn.fnameescape(file.fname))
	end)

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "<C-h>", api.tree.toggle_hidden_filter, opts("Toggle: Hidden Files"))
end

require("nvim-tree").setup({
	actions = {
		open_file = {
			resize_window = false,
		},
	},

	sort = {
		sorter = "case_sensitive",
	},

	view = {
		width = 40,
		side = "left",
	},

	update_focused_file = {
		enable = true,
	},

	modified = {
		enable = true,
	},

	renderer = {
		group_empty = false,
		root_folder_label = false,
		highlight_git = true,
		special_files = {},

		icons = {
			git_placement = "after",
			modified_placement = "after",
			diagnostics_placement = "after",

			show = {
				folder_arrow = false,
			},

			web_devicons = {
				file = {
					enable = true,
					color = true,
				},
				folder = {
					enable = false,
					color = true,
				},
			},

			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "",
					untracked = "",
					deleted = "",
					ignored = "",
				},
			},
		},

		indent_markers = {
			enable = true,
			inline_arrows = true,
		},
	},

	filters = {
		git_ignored = false,
		dotfiles = false,
		custom = {
			"^.git$",
		},
	},

	on_attach = my_on_attach,
})

vim.keymap.set("n", "<leader><Tab>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-e>", "<Esc>:NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ec", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local wins = vim.api.nvim_list_wins()
		local real_wins = 0
		for _, w in ipairs(wins) do
			local buf = vim.api.nvim_win_get_buf(w)
			local ft = vim.bo[buf].filetype
			local floating = vim.api.nvim_win_get_config(w).relative ~= ""
			if ft ~= "NvimTree" and not floating then
				real_wins = real_wins + 1
			end
		end
		if real_wins == 1 then
			vim.cmd("NvimTreeClose")
		end
	end,
})
