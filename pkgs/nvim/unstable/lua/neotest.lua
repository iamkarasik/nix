local vim = vim
local neotest = require("neotest")

neotest.setup({
	adapters = {
		require("neotest-java")({
			junit_jar = nil,
			incremental_build = true,
			dap = { justMyCode = false },
		}),
		require("neotest-go")({
			dap = { justMyCode = false },
		}),
	},
})

vim.keymap.set("n", "<leader>tt", function()
	neotest.run.run(vim.fn.expand("%"))
	neotest.summary.open()
end, { desc = "Run current file" })

vim.keymap.set("n", "<leader>tT", function()
	neotest.run.run(vim.uv.cwd())
	neotest.summary.open()
end, { desc = "Run all test files" })

vim.keymap.set("n", "<leader>tr", function()
	neotest.run.run()
	neotest.summary.open()
end, { desc = "Run nearest test" })

vim.keymap.set("n", "<leader>tl", function()
	neotest.run.run_last()
	neotest.summary.open()
end, { desc = "Run last test" })

vim.keymap.set("n", "<leader>ts", function()
	neotest.summary.toggle()
end, { desc = "Toggle summary" })

vim.keymap.set("n", "<leader>to", function()
	neotest.output.open({ enter = true, auto_close = true })
end, { desc = "Show test output" })

vim.keymap.set("n", "<leader>tO", function()
	neotest.output_panel.toggle()
end, { desc = "Toggle test output panel" })

vim.keymap.set("n", "<leader>tS", function()
	neotest.run.stop()
end, { desc = "Stop nearest test" })

vim.keymap.set("n", "<leader>tw", function()
	neotest.watch.toggle(vim.fn.expand("%"))
	neotest.summary.open()
end, { desc = "Toggle test watch" })

vim.keymap.set("n", "<leader>td", function()
	neotest.run.run({ strategy = "dap" })
	neotest.summary.open()
end, { desc = "Debug nearest test" })

vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() neotest.summary.close() end,
})
