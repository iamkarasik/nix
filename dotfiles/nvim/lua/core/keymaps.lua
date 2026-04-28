vim.g.mapleader = " "

local keymap = vim.keymap

-- clear highlight
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- don't copy to register on x
keymap.set("n", "x", '"_x')

-- shift selection
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("n", "J", "mzJ`z")

-- Keep cursor in center when doing Ctrl+D/Ctrl+U
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in center when finding search terms
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- change window with ctrl+hjkl
keymap.set("n", "<c-l>", "<c-w>l")
keymap.set("n", "<c-h>", "<c-w>h")
keymap.set("n", "<c-k>", "<c-w>k")
keymap.set("n", "<c-j>", "<c-w>j")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
end, { expr = true })

keymap.set({ "i", "s" }, "<S-Tab>", function()
	if vim.snippet.active({ direction = -1 }) then
		return "<cmd>lua vim.snippet.jump(-1)<cr>"
	else
		return "<S-Tab>"
	end
end, { expr = true })

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
