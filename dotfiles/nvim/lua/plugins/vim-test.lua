-- Test output flows through toggleterm so it matches the terminal UI we already use.
vim.g["test#custom_strategies"] = {
	toggleterm = function(cmd)
		require("toggleterm").exec(cmd)
	end,
}
vim.g["test#strategy"] = "toggleterm"

-- Verbose Go output shows subtest names.
vim.g["test#go#runner"] = "gotest"
vim.g["test#go#gotest#options"] = "-v"

-- Plain runs
vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { silent = true, desc = "Test: nearest" })
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { silent = true, desc = "Test: current file" })
vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { silent = true, desc = "Test: whole suite" })
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { silent = true, desc = "Test: last" })
vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { silent = true, desc = "Test: jump to test file" })

-- Debug: dispatch to the language-specific plugin already installed.
-- These wire directly into nvim-dap; DAP UI opens, breakpoints hit, step in/out, etc.
vim.keymap.set("n", "<leader>td", function()
	local ft = vim.bo.filetype
	if ft == "java" then
		require("jdtls").test_nearest_method()
	elseif ft == "go" then
		require("dap-go").debug_test()
	else
		vim.notify("No debug-test wired for filetype: " .. ft, vim.log.levels.WARN)
	end
end, { desc = "Test: debug nearest" })

vim.keymap.set("n", "<leader>tD", function()
	local ft = vim.bo.filetype
	if ft == "java" then
		require("jdtls").test_class()
	elseif ft == "go" then
		require("dap-go").debug_last_test()
	else
		vim.notify("No debug-test-class wired for filetype: " .. ft, vim.log.levels.WARN)
	end
end, { desc = "Test: debug class (Java) / last (Go)" })
