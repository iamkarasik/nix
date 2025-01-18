local sonarlint = require("sonarlint")

sonarlint.setup({
	server = {
		cmd = {
			"nix-shell",
			"-p",
			"sonarlint-ls",
      "--run",
      "sonarlint-ls",
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
