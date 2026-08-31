local wk = require("which-key")

wk.setup({
	preset = "helix",
	sort = { "desc" },
})

wk.add({
	{ "<leader>c", group = "Code" },
	{ "<leader>d", group = "Debug" },
	{ "<leader>du", group = "Debug UI" },
	{ "<leader>e", group = "Explorer" },
	{ "<leader>f", group = "Find" },
	{ "<leader>g", group = "Git" },
	{ "<leader>h", group = "Hunk" },
	{ "<leader>m", group = "Format" },
	{ "<leader>r", group = "Refactor" },
	{ "<leader>t", group = "Test" },
	{ "<leader>T", group = "Terminal" },
	{ "<leader>v", group = "Toggle" },
})
