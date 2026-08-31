local fzf = require("fzf-lua")
fzf.register_ui_select(function(ui_opts, _)
	local prompt = ui_opts.prompt and ui_opts.prompt:gsub("[:%s]+$", "") or "Select"
	return {
		prompt = "> ",
		winopts = {
			title = " " .. prompt .. " ",
			title_pos = "center",
			height = 0.35,
			width = 0.55,
		},
	}
end)

fzf.setup({
	defaults = {
		formatter = "path.filename_first",
	},
	fzf_opts = {
		["--tiebreak"] = "begin",
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

	files = {
		fzf_opts = {
			["--nth"] = "-1",
		},
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

vim.keymap.set("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "Find: symbols (file)" })
vim.keymap.set("n", "<leader>fS", fzf.lsp_live_workspace_symbols, { desc = "Find: symbols (workspace)" })
vim.keymap.set("n", "<leader>fr", fzf.resume, { desc = "Find: resume last picker" })
