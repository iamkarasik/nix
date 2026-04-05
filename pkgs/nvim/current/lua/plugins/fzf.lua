local fzf = require("fzf-lua")
fzf.register_ui_select({ prompt = "> " })

fzf.setup({
	defaults = {
		formatter = "path.filename_first",
	},
	fzf_opts = {
		["--tiebreak"] = "begin",
		["--nth"] = "-1",
	},
	file_ignore_patterns = {
		"%.class$",
		"%.o$",
		"%.so$",
		"%.dll$",
		"%.exe$",
		"%.out$",
		"%.a$",
		"%.lib$",
		"%.bin$",
		"%.obj$",
		"%.pyc$",
		"%.pyo$",
		"%.pyd$",
		"%.iml$",
		"%.ipr$",
		"%.iws$",
		"%.log$",
		"/%.svn/",
		"/%.hg/",
		"/build/",
		"/target/",
		"/dist/",
		"/node_modules/",
		"/vendor/",
		"/%.cache/",
		"/%.idea/",
		"/%.vscode/",
		"/env/",
		"/venv/",
		"__pycache__/",
		".git/",
		"dist-newstyle/",
	},
})

-- Keymaps
vim.keymap.set("n", "<leader>ff", function()
	fzf.files({ cwd_prompt = false })
end, { desc = "Find: files" })

vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Find: grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find: buffers" })
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Find: help tags" })

vim.keymap.set("n", "<leader>D", fzf.lsp_document_diagnostics, { desc = "LSP: Show All Diagnostics" })

vim.keymap.set("n", "<leader>fc", function()
	fzf.live_grep({ search = vim.fn.expand("<cword>") })
end, { desc = "Find: grep (Current Word)" })
