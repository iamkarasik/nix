-- Load templates/skeleton.<ext> and substitute tokens.
-- Base tokens: {{CLASS}}, {{FILENAME}}, {{DATE}}, {{CURSOR}} (position marker).
-- Per-ext extras: drop a sibling `skeleton.<ext>.lua` returning a function(abs)
-- that returns a table of extra tokens.
--
-- Fires on BufNewFile *and* on BufReadPost for empty files, so that tools
-- which touch the file before opening it (nvim-tree, fugitive, external
-- scripts) still trigger the skeleton.
local function apply_skeleton(args)
	-- BufReadPost guard: only fill genuinely empty files.
	if args.event == "BufReadPost" and vim.fn.getfsize(args.file) > 0 then
		return
	end

	local abs = vim.fn.fnamemodify(args.file, ":p")
	local ext = vim.fn.fnamemodify(abs, ":e")
	if ext == "" then
		return
	end

	local templates_dir = vim.fn.stdpath("config") .. "/templates"
	local template = templates_dir .. "/skeleton." .. ext
	if vim.fn.filereadable(template) == 0 then
		return
	end

	local tokens = {
		CLASS = vim.fn.fnamemodify(abs, ":t:r"),
		FILENAME = vim.fn.fnamemodify(abs, ":t"),
		DATE = os.date("%Y-%m-%d"),
	}

	local extra_path = templates_dir .. "/skeleton." .. ext .. ".lua"
	if vim.fn.filereadable(extra_path) == 1 then
		local ok, mod = pcall(dofile, extra_path)
		if ok and type(mod) == "function" then
			local ok2, extras = pcall(mod, abs)
			if ok2 and type(extras) == "table" then
				for k, v in pairs(extras) do
					tokens[k] = v
				end
			end
		end
	end

	local content = table.concat(vim.fn.readfile(template), "\n")
	content = content:gsub("{{([%w_]+)}}", function(k)
		return tokens[k] or ("{{" .. k .. "}}")
	end)

	local lines = vim.split(content, "\n", { plain = true })
	if lines[#lines] == "" then
		table.remove(lines)
	end

	local cursor_row, cursor_col
	for i, line in ipairs(lines) do
		local col = line:find("{{CURSOR}}", 1, true)
		if col then
			cursor_row, cursor_col = i, col - 1
			lines[i] = line:gsub("{{CURSOR}}", "", 1)
			break
		end
	end

	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
	if cursor_row then
		vim.api.nvim_win_set_cursor(0, { cursor_row, cursor_col })
	end
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
	callback = apply_skeleton,
})
