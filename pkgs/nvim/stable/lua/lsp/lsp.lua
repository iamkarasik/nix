require("lazy-lsp").setup({
	preferred_servers = {
		typescript = { "ts_ls", "eslint" },
		javascript = { "ts_ls", "eslint" },
		javascriptreact = { "ts_ls", "eslint" },
		typescriptreact = { "ts_ls", "eslint" },
	},
	prefer_local = true,
	excluded_servers = {
		"ccls", -- prefer clangd
		"denols", -- prefer eslint and ts_ls
		"docker_compose_language_service", -- yamlls should be enough?
		"flow", -- prefer eslint and ts_ls
		"ltex", -- grammar tool using too much CPU
		"quick_lint_js", -- prefer eslint and ts_ls
		"scry", -- archived on Jun 1, 2023
		"tailwindcss", -- associates with too many filetypes
		"biome", -- not mature enough to be default
	},
})

-- LSP Keymaps
local keymap = vim.keymap
keymap.set("n", "gR", ":Telescope lsp_references<CR>", { desc = "Find References" })
keymap.set("n", "gD", vim.lsp.buf.declaration)
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set("n", "K", vim.lsp.buf.hover)
keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Find Implementations" })
keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", { desc = "Show All Diagnostics" })
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

-- vim.diagnostic.config({
-- 	virtual_text = false,
-- })

keymap.set("n", "<leader>td", function()
	vim.diagnostic.config({
		virtual_text = not vim.diagnostic.config().virtual_text,
	})
end, { silent = true, noremap = true, desc = "Toggle Virtual Text" })

-- vim.lsp.set_log_level('debug')
