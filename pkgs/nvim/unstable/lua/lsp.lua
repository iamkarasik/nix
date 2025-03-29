local vim = vim

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["gopls"].setup({
	capabilities = capabilities,
})
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
})
lspconfig["nil_ls"].setup({
	capabilities = capabilities,
})
lspconfig["ts_ls"].setup({
	capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gR", ":Telescope lsp_references<CR>", { desc = "Find References" })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", { desc = "Show All Diagnostics" })
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
	end,
})

local diagnostics_text = function()
	local cur = vim.diagnostic.config().virtual_text

	if not cur then
		vim.diagnostic.config({ virtual_text = { prefix = "●", source = "always" } })
	else
		vim.diagnostic.config({ virtual_text = false })
	end
end

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.keymap.set("n", "<leader>vt", diagnostics_text, { silent = true, noremap = true, desc = "Toggle [V]irtual [T]ext" })

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticHint", linehl = "", numhl = "" })

