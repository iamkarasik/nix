local vim = vim

local set_keymaps = function(opts)
	vim.keymap.set("n", "gR", ":Telescope lsp_references<CR>", { desc = "LSP: Find References" })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", { desc = "LSP: Find Implementations" })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Actions" })
	vim.keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", { desc = "LSP: Show All Diagnostics" })
	vim.keymap.set("n", "<leader>df", function()
		vim.diagnostic.open_float({ border = "rounded" })
	end, { desc = "LSP: Show Diagnostic" })
	vim.keymap.set("n", "<leader>vt", function()
		local cur = vim.diagnostic.config().virtual_text

		if not cur then
			vim.diagnostic.config({ virtual_text = { prefix = "●", source = true } })
		else
			vim.diagnostic.config({ virtual_text = false })
		end
	end, { silent = true, noremap = true, desc = "Toggle [V]irtual [T]ext" })
end

local set_cursor_highlights = function(client_id, bufnr)
	local client = vim.lsp.get_client_by_id(client_id)
	if not client then
		return
	end
	if client.server_capabilities.documentHighlightProvider then
		local group = vim.api.nvim_create_augroup("LspDocumentHighlight_" .. bufnr, { clear = true })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = bufnr,
			group = group,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = bufnr,
			group = group,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		set_keymaps({ buffer = bufnr })
		set_cursor_highlights(args.data.client_id, bufnr)
	end,
})

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = "󰋼 ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})

vim.lsp.enable("gopls", true)
vim.lsp.enable("hls", true)
vim.lsp.enable("lua_ls", true)
vim.lsp.enable("nil_ls", true)
vim.lsp.enable("ts_ls", true)

vim.lsp.log.set_level("WARN")
