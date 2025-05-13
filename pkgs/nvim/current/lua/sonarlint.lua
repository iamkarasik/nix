-- vim.keymap.set('n', '<leader>sl', function() 
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
-- end, { noremap = true })
