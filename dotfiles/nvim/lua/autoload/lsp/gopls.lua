return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
	root_markers = { "go.mod", "go.work", ".git" },
	settings = {
		gopls = {
			gofumpt = true,
			staticcheck = true,
			analyses = {
				atomicalign = true,
				deepequalerrors = true,
				directive = true,
				infertypeargs = true,
				nilness = true,
				shadow = true,
				simplifycompositelit = true,
				simplifyrange = true,
				simplifyslice = true,
				sortslice = true,
				stringintconv = true,
				unmarshal = true,
				unreachable = true,
				unusedparams = true,
				unusedvariable = true,
				unusedwrite = true,
				useany = true,
			},
		},
	},
	on_attach = function(client, bufnr)
		vim.b[bufnr].completion = false

		local function organize_imports()
			local params = vim.lsp.util.make_range_params(0, "utf-8")
			params.context = { only = { "source.organizeImports" }, diagnostics = {} }
			local results = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)
			for _, r in pairs(results or {}) do
				for _, a in pairs(r.result or {}) do
					if a.edit then
						vim.lsp.util.apply_workspace_edit(a.edit, "utf-8")
					end
				end
			end
			return false
		end

		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function(_)
				organize_imports()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
}
