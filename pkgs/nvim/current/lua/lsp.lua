local vim = vim

local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

lspconfig["gopls"].setup({
	capabilities = capabilities,
})
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				},
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
				-- library = vim.api.nvim_get_runtime_file("", true)
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

lspconfig["nil_ls"].setup({
	capabilities = capabilities,
})
lspconfig["ts_ls"].setup({
	capabilities = capabilities,
})
lspconfig["hls"].setup({
	capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }
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
	end,
})

local diagnostics_text = function()
	local cur = vim.diagnostic.config().virtual_text

	if not cur then
		vim.diagnostic.config({ virtual_text = { prefix = "●", source = true } })
	else
		vim.diagnostic.config({ virtual_text = false })
	end
end

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

vim.keymap.set("n", "<leader>vt", diagnostics_text, { silent = true, noremap = true, desc = "Toggle [V]irtual [T]ext" })

-- vim.lsp.set_log_level("debug")
