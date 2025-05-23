require("sonarqube").setup({
	lsp = {
		cmd = { vim.fn.exepath("sonarlint-ls") },
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	},
	csharp = { enabled = false },
})
