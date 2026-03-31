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
	sort = {
		sorter = "case_sensitive",
	},

	view = {
		width = 35,
		side = "left",
	},

	update_focused_file = {
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
					enable = true,
					color = true,
				},
			},

			glyphs = {
				default = " ",
				symlink = " ",
				folder = {
					arrow_closed = " ",
					arrow_open = " ",
					default = " ",
					open = " ",
					empty = " ",
					empty_open = " ",
					symlink = " ",
					symlink_open = " ",
				},
				git = {
					unstaged = "●",
					staged = "",
					unmerged = "",
					renamed = "",
					untracked = "",
					deleted = "",
					ignored = "",
					-- staged = "✓",
					-- unmerged = "⚠",
					-- renamed = "➜",
					-- untracked = "+",
					-- deleted = "✕",
					-- ignored = "*",
				},
			},
		},

		indent_markers = {
			enable = true,
			inline_arrows = true,
		},
	},

	filters = {
		git_ignored = true,
		dotfiles = false,
	},

	on_attach = my_on_attach,
})

vim.keymap.set("n", "<C-t>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle Tree" })
vim.keymap.set("n", "<leader>ts", "<cmd>NvimTreeToggleSide<cr>", { desc = "Toggle Tree Side" })

vim.keymap.set("n", "<leader><Tab>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-e>", "<Esc>:Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ee", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ec", ":Neotree reveal<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>eg", ":Neotree git_status<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>eb", ":Neotree buffers<CR>", { noremap = true, silent = true })

vim.api.nvim_create_user_command("NvimTreeToggleSide", function()
	local api = require("nvim-tree.api")
	local view = require("nvim-tree.view")

	local current_side = view.View.side
	local new_side = current_side == "left" and "right" or "left"

	local was_open = view.is_visible()

	if was_open then
		api.tree.close()
	end

	view.View.side = new_side

	if was_open then
		api.tree.open()
	end
end, { desc = "Toggle NvimTree side (left/right)" })

vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		vim.cmd("NvimTreeClose")
	end,
})
