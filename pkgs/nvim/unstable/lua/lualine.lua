local vim = vim

local normal = vim.api.nvim_get_hl_by_name("Normal", true)
local fg = string.format("#%06x", normal.foreground)
local bg = string.format("#%06x", normal.background)

local reset = "%#Normal#"

local devicons = require("nvim-web-devicons")

local M = {}

M.symbols = {
	vim = "",
	git = "",
	block = "█",
	added = "",
	changed = "",
	removed = "",
	gear = "",
	cursor = "",
	folder = "",
}

M.display_modes = {
	Normal = true,
	Visual = true,
	Insert = true,
	Replace = true,
	Command = true,
}

M.skip_file_type = {
	NvimTree = true,
	TelescopePrompt = true,
}

M.should_display = function()
	local mode = (M.modes[vim.api.nvim_get_mode().mode] or { "UNKNOWN", "Unknown" })[2]
	local file_type = vim.bo.filetype or ""
	return M.display_modes[mode] ~= nil and M.skip_file_type[file_type] == nil
end

M.modes = {
	["n"] = { "NORMAL", "Normal" },
	["no"] = { "NORMAL", "Normal" },
	["nov"] = { "NORMAL", "Normal" },
	["noV"] = { "NORMAL", "Normal" },
	["noCTRL-V"] = { "NORMAL", "Normal" },
	["niI"] = { "NORMAL", "Normal" },
	["niR"] = { "NORMAL", "Normal" },
	["niV"] = { "NORMAL", "Normal" },

	["v"] = { "VISUAL", "Visual" },
	["vs"] = { "VISUAL", "Visual" },
	["V"] = { "V-LINE", "Visual" },
	["Vs"] = { "V-LINE", "Visual" },
	[""] = { "V-BLOCK", "Visual" },

	["i"] = { "INSERT", "Insert" },
	["ic"] = { "INSERT", "Insert" },
	["ix"] = { "INSERT", "Insert" },

	["t"] = { "TERMINAL", "Unknown" },
	["nt"] = { "TERMINAL", "Unknown" },
	["ntT"] = { "TERMINAL", "Unknown" },

	["R"] = { "REPLACE", "Replace" },
	["Rc"] = { "REPLACE", "Replace" },
	["Rx"] = { "REPLACE", "Replace" },
	["Rvc"] = { "REPLACE", "Replace" },
	["Rvx"] = { "REPLACE", "Replace" },

	["c"] = { "COMMAND", "Command" },
	["cv"] = { "COMMAND", "Command" },
	["ce"] = { "COMMAND", "Command" },
	["cr"] = { "COMMAND", "Command" },

	["s"] = { "SELECT", "Unknown" },
	["S"] = { "S-LINE", "Unknown" },
	[""] = { "S-BLOCK", "Unknown" },
	["r"] = { "PROMPT", "Unknown" },
	["rm"] = { "MORE", "Unknown" },
	["r?"] = { "CONFIRM", "Unknown" },
	["x"] = { "CONFIRM", "Unknown" },
	["!"] = { "SHELL", "Unknown" },
}

M.get_mode = function()
	if not M.should_display() then
		return ""
	end
	local mode = vim.api.nvim_get_mode().mode
	local icon = "%#LualineIconMode" .. M.modes[mode][2] .. "#" .. M.symbols.vim .. " "
	local text = "%#LualineTextMode" .. M.modes[mode][2] .. "# " .. M.modes[mode][1] .. " "
	return icon .. text .. reset
end

M.get_filename = function()
	local filename = vim.fn.expand("%:t")
	local icon, hl_group = devicons.get_icon(filename)

	local icon_color = vim.api.nvim_get_hl_by_name(hl_group, true).foreground
	local dark_bg = vim.api.nvim_get_hl_by_name("LualineIconModeNormal", true).foreground
	local light_bg = vim.api.nvim_get_hl_by_name("LualineTextModeNormal", true).background

	vim.api.nvim_set_hl(0, "Lualine" .. hl_group, { bg = icon_color, fg = dark_bg })
	local icon_block = "%#Lualine" .. hl_group .. "#" .. icon .. " "

	vim.api.nvim_set_hl(0, "Lualine" .. hl_group .. "Filename", { bg = light_bg, fg = icon_color })
	return icon_block .. "%#Lualine" .. hl_group .. "Filename# " .. filename .. " " .. reset
end

M.get_git_branch = function()
	local branch = vim.b.gitsigns_head or "" -- Get branch name
	if branch == "" then
		return ""
	end

	local icon_block = "%#LualineIconGitBranch#" .. M.symbols.git .. " "
	return icon_block .. "%#LualineTextGitBranch# " .. branch
end

M.get_git_diff = function()
	if not M.should_display() then
		return ""
	end

	local branch = vim.b.gitsigns_head or "" -- Get branch name
	if branch == "" then
		return ""
	end

	local added = vim.b.gitsigns_status_dict and vim.b.gitsigns_status_dict.added or 0
	local changed = vim.b.gitsigns_status_dict and vim.b.gitsigns_status_dict.changed or 0
	local removed = vim.b.gitsigns_status_dict and vim.b.gitsigns_status_dict.removed or 0

	vim.api.nvim_set_hl(0, "LualineIconGitAdded", { link = "GitSignsAdd" })
	vim.api.nvim_set_hl(0, "LualineIconGitChanged", { link = "GitSignsChange" })
	vim.api.nvim_set_hl(0, "LualineIconGitRemoved", { link = "GitSignsDelete" })

	local diff_info = ""
	diff_info = diff_info .. "%#LualineIconGitAdded#" .. M.symbols.added .. " " .. added .. " "
	diff_info = diff_info .. "%#LualineIconGitChanged#" .. M.symbols.changed .. " " .. changed .. " "
	diff_info = diff_info .. "%#LualineIconGitRemoved#" .. M.symbols.removed .. " " .. removed

	return diff_info .. reset .. " "
end

M.get_diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	cond = M.should_display,
}

M.get_lsp = function()
  if not M.should_display() then
		return ""
	end

	local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })

	if next(clients) == nil then
		return ""
	end

	local client_name = ""
  for _, client in ipairs(clients) do
    if client.name ~= "sonarlint.nvim" then
      client_name = client.name
      break
    end
  end

  if client_name == "" then
    return ""
  end

	local icon_block = "%#LualineIconLsp#" .. M.symbols.gear .. " "
	return icon_block .. "%#LualineTextLsp# " .. client_name .. " " .. reset
end

M.get_project_root = function()
	local icon_block = "%#LualineIconProjectRoot#" .. M.symbols.folder .. " "
	return icon_block .. "%#LualineTextProjectRoot# " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " " .. reset
end

M.get_cursor = function()
	if not M.should_display() then
		return ""
	end
	local icon_block = "%#LualineIconCursor#" .. M.symbols.cursor .. " "
	return icon_block .. "%#LualineTextCursor# " .. vim.fn.line(".") .. ":" .. vim.fn.col(".") .. " " .. reset
end

local config = {
	options = {
		icons_enabled = true,
		theme = {
			normal = {
				a = { fg = fg, bg = bg, gui = "bold" },
				b = { fg = fg, bg = bg },
				c = { fg = fg, bg = bg },
				x = { fg = fg, bg = bg },
				y = { fg = fg, bg = bg },
				z = { fg = fg, bg = bg },
			},
			insert = {
				a = { fg = fg, bg = bg },
				b = { fg = fg, bg = bg },
				c = { fg = fg, bg = bg },
				x = { fg = fg, bg = bg },
				y = { fg = fg, bg = bg },
				z = { fg = fg, bg = bg },
			},
			visual = {
				a = { fg = fg, bg = bg },
				b = { fg = fg, bg = bg },
				c = { fg = fg, bg = bg },
				x = { fg = fg, bg = bg },
				y = { fg = fg, bg = bg },
				z = { fg = fg, bg = bg },
			},
			replace = {
				a = { fg = fg, bg = bg },
				b = { fg = fg, bg = bg },
				c = { fg = fg, bg = bg },
				x = { fg = fg, bg = bg },
				y = { fg = fg, bg = bg },
				z = { fg = fg, bg = bg },
			},
			command = {
				a = { fg = fg, bg = bg },
				b = { fg = fg, bg = bg },
				c = { fg = fg, bg = bg },
				x = { fg = fg, bg = bg },
				y = { fg = fg, bg = bg },
				z = { fg = fg, bg = bg },
			},
		},
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = true,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = { M.get_mode },
		lualine_b = { M.get_filename, M.get_git_branch, M.get_git_diff },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { M.get_diagnostics },
		lualine_z = { M.get_lsp, M.get_project_root, M.get_cursor },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
}

require("lualine").setup(config)
