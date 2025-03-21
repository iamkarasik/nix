require("sonarlint").setup({
	server = {
		cmd = {
			"sonarlint-ls",
		},
		settings = {
			sonarlint = {
				test = "test",
			},
		},
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
