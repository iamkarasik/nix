local vim = vim
local dap = require("dap")
local ui = require("dapui")
ui.setup()

require("dap-go").setup({
	dap_configurations = {
		{
			type = "go",
			name = "Debug Remote (Attach)",
			mode = "remote",
			request = "attach",
		},
	},
	delve = {
		path = "dlv",
		initialize_timeout_sec = 20,
		port = "${port}",
		args = {},
		build_flags = {},
		detached = vim.fn.has("win32") == 0,
		cwd = nil,
	},
	tests = {
		verbose = false,
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	ui.open({})
end

dap.configurations.java = {
	{
		type = 'java';
		request = 'attach';
		name = "Debug Remote (Attach)";
		hostName = "127.0.0.1";
		vmArgs = "-Xmx2g";
		port = 5005;
	},
}

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
  }
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end

-- nvim-dap
vim.keymap.set("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Debug: Breakpoint Condition" })
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "Debug: Run/Continue" })
vim.keymap.set("n", "<leader>da", function() require("dap").continue({ before = get_args }) end, { desc = "Debug: Run with Args" })
vim.keymap.set("n", "<leader>dC", function() require("dap").run_to_cursor() end, { desc = "Debug: Run to Cursor" })
vim.keymap.set("n", "<leader>dg", function() require("dap").goto_() end, { desc = "Debug: Go to Line (No Execute)" })
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<leader>dj", function() require("dap").down() end, { desc = "Debug: Down" })
vim.keymap.set("n", "<leader>dk", function() require("dap").up() end, { desc = "Debug: Up" })
vim.keymap.set("n", "<leader>dl", function() require("dap").run_last() end, { desc = "Debug: Run Last" })

vim.keymap.set("n", "<leader>do", function() require("dap").step_out() end, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>dO", function() require("dap").step_over() end, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<leader>dP", function() require("dap").pause() end, { desc = "Debug: Pause" })
vim.keymap.set("n", "<leader>dr", function() require("dap").repl.toggle() end, { desc = "Debug: Toggle REPL" })
vim.keymap.set("n", "<leader>ds", function() require("dap").session() end, { desc = "Debug: Session" })
vim.keymap.set("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Debug: Terminate" })
vim.keymap.set("n", "<leader>dw", function() require("dap.ui.widgets").hover() end, { desc = "Debug: Widgets" })

-- nvim-dap-ui
vim.keymap.set("n", "<leader>du", function() require("dapui").toggle({}) end, { desc = "Debug: Toggle UI" })
vim.keymap.set({ "n", "v" }, "<leader>de", function() require("dapui").eval() end, { desc = "Debug: Eval" })

-- Lua plugins specifically
vim.keymap.set('n', '<leader>dL', function() require"osv".launch({port = 8086}) end, { desc = "Debug: Lua Plugin", noremap = true })

