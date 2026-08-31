require("gitsigns").setup({
	numhl = false,
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end)

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end)

		map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Git: reset hunk" })
		map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Git: reset buffer" })

		map("v", "<leader>gr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Git: reset hunk" })

		map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Git: preview hunk" })
		map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "Git: preview hunk inline" })

		map("n", "<leader>gb", function()
			gitsigns.blame_line({ full = false })
		end, { desc = "Git: blame line" })
	end,
})
