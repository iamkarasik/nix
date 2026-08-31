vim.g.mapleader = " "

local keymap = vim.keymap

-- clear highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- don't copy to register on x
keymap.set("n", "x", '"_x', { desc = "Delete char (no yank)" })

-- shift selection
keymap.set("v", "<", "<gv", { desc = "Dedent, keep selection" })
keymap.set("v", ">", ">gv", { desc = "Indent, keep selection" })
keymap.set("n", "J", "mzJ`z", { desc = "Join line, keep cursor" })

-- Keep cursor in center when doing Ctrl+D/Ctrl+U
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down (centered)" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up (centered)" })

-- Keep cursor in center when finding search terms
keymap.set("n", "n", "nzzzv", { desc = "Next match (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Prev match (centered)" })

-- change window with ctrl+hjkl
keymap.set("n", "<c-l>", "<c-w>l", { desc = "Window: right" })
keymap.set("n", "<c-h>", "<c-w>h", { desc = "Window: left" })
keymap.set("n", "<c-k>", "<c-w>k", { desc = "Window: up" })
keymap.set("n", "<c-j>", "<c-w>j", { desc = "Window: down" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Buffers
keymap.set("n", "<A-c>", function()
	local buf = vim.api.nvim_get_current_buf()
	if not vim.bo[buf].buflisted then
		vim.cmd(buf .. "bd")
		return
	end

	local bufs = vim.tbl_filter(function(b)
		return vim.bo[b].buflisted and b ~= buf
	end, vim.api.nvim_list_bufs())

	if #bufs > 0 then
		vim.cmd("buffer " .. bufs[1])
	else
		vim.cmd("enew")
	end
	vim.api.nvim_buf_delete(buf, { force = false })
end, { silent = true, desc = "Buffer: delete" })
keymap.set("n", "<A-n>", ":bn<CR>", { silent = true, desc = "Buffer: next" })
keymap.set("n", "<A-p>", ":bp<CR>", { silent = true, desc = "Buffer: previous" })

-- Snippets
keymap.set({ "i", "s" }, "<Tab>", function()
	if vim.snippet.active({ direction = 1 }) then
		return "<cmd>lua vim.snippet.jump(1)<cr>"
	else
		return "<Tab>"
	end
end, { expr = true, desc = "Snippet: jump forward / Tab" })

keymap.set({ "i", "s" }, "<S-Tab>", function()
	if vim.snippet.active({ direction = -1 }) then
		return "<cmd>lua vim.snippet.jump(-1)<cr>"
	else
		return "<S-Tab>"
	end
end, { expr = true, desc = "Snippet: jump back / Shift-Tab" })

P = function(...)
	local args = { ... }
	local output = {}
	for _, arg in ipairs(args) do
		table.insert(output, vim.inspect(arg))
	end
	print(table.concat(output, ", "))
	local unpack_fn = table.unpack or unpack
	return unpack_fn(args)
end
