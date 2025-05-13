local notify = require("notify")

notify.setup({
	timeout = 1000,
})

vim.keymap.set("n", "<C-n>", function() notify.dismiss({ silent = true, pending = true }) end, { desc = "Dismiss notification" })

vim.notify = notify
