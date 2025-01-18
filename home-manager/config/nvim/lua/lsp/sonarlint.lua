local sonarlint = require("sonarlint")

sonarlint.setup({
	server = {
		cmd = { "sonarlint-ls" },
	},
	filetypes = {
		"go",
		"java",
		"javascript",
		"javascriptreact",
		"terraform",
		"typescript",
		"typescriptreact",
		"html",
		"xml",
	},
})
