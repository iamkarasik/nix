require("sonarqube").setup({
	lsp = {
		cmd = { vim.fn.exepath("sonarlint-ls") },
		capabilities = require("blink.cmp").get_lsp_capabilities()
	},
	csharp = { enabled = false },
})
