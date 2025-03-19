local devicons = require('nvim-web-devicons')

local M = {}

M.symbols = {
  vim = "",
  git = "",
  block = "█",
  added = "",
  changed = '',
  removed = '',
}

M.modes = {
  ["n"] = { "NORMAL", "Normal" },
  ["no"] = { "NORMAL", "Normal" },
  ["nov"] = { "NORMAL", "Normal" },
  ["noV"] = { "NORMAL", "Normal" },
  ["noCTRL-V"] = { "NORMAL", "Normal" },
  ["niI"] = { "NORMAL", "Normal" },
  ["niR"] = { "NORMAL", "Normal" },
  ["niV"] = { "NORMAL", "Normal" },
  ["nt"] = { "TERMINAL", "NTerminal" },
  ["ntT"] = { "TERMINAL", "NTerminal" },

  ["v"] = { "VISUAL", "Visual" },
  ["vs"] = { "VISUAL", "Visual" },
  ["V"] = { "V-LINE", "Visual" },
  ["Vs"] = { "V-LINE", "Visual" },
  [""] = { "V-BLOCK", "Visual" },

  ["i"] = { "INSERT", "Insert" },
  ["ic"] = { "INSERT", "Insert" },
  ["ix"] = { "INSERT", "Insert" },

  ["t"] = { "TERMINAL", "Unknown" },

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

M.get_symbol = function()
  local mode = vim.api.nvim_get_mode().mode
  local hl_group = "LualineSymbolMode" .. M.modes[mode][2]
  return "%#" .. hl_group .. "#" .. M.symbols.vim
end

M.get_mode = function()
  local mode = vim.api.nvim_get_mode().mode
  local hl_group = "LualineMode" .. M.modes[mode][2]
  return "%#" .. hl_group .. "#" .. M.modes[mode][1] .. " %#Normal#"
end

M.get_filename = function()
  local filename = vim.fn.expand('%:t')
  local icon, hl_group = devicons.get_icon(filename)

  local icon_color = vim.api.nvim_get_hl_by_name(hl_group, true).foreground
  local dark_bg = vim.api.nvim_get_hl_by_name("LualineSymbolModeNormal", true).foreground
  local light_bg = vim.api.nvim_get_hl_by_name("LualineModeNormal", true).background

  vim.api.nvim_set_hl(0, "Lualine" .. hl_group, { bg = icon_color, fg = dark_bg })
  local icon_block = "%#Lualine" .. hl_group .. "#" .. icon .. " "

  vim.api.nvim_set_hl(0, "Lualine" .. hl_group .. "Filename", { bg = light_bg, fg = icon_color })
  return icon_block .. "%#Lualine" .. hl_group .. "Filename" .. "# " .. filename
end

M.get_git = function()
  local branch = vim.b.gitsigns_head or '' -- Get branch name
  if branch == '' then return '' end

  local added = vim.b.gitsigns_status_dict and vim.b.gitsigns_status_dict.added or 0
  local changed = vim.b.gitsigns_status_dict and vim.b.gitsigns_status_dict.changed or 0
  local removed = vim.b.gitsigns_status_dict and vim.b.gitsigns_status_dict.removed or 0

  local diff_info = ' '
  diff_info = diff_info .. M.symbols.added .. " " .. added .. " "
  diff_info = diff_info .. M.symbols.changed .. " " .. changed .. " "
  diff_info = diff_info .. M.symbols.removed .. " " .. removed .. " "

  return "%#LualineGitBranch#" .. M.symbols.git .. " " .. branch .. diff_info .. "%#Normal#"
end

local config = {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { "NvimTree", "TelescopePrompt" },
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
    }
  },
  sections = {
    lualine_a = {M.get_symbol, M.get_mode},
    lualine_b = {M.get_filename, M.get_git},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_right {
  function()
    return string.format("%d:%d", vim.fn.line('.'), vim.fn.col('.'))
  end,
}

ins_right {
  function()
    return string.format("%s", vim.bo.filetype)
  end,
}

ins_right {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ', hint= ' ' },
  -- diagnostics_color = {
    -- error = {},
    -- warn = {},
    -- info = {},
  -- },
  always_visible = true,
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

-- ins_left {
--   function()
--     local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
--     local clients = vim.lsp.get_clients()
--     if next(clients) == nil then
--       return nil
--     end
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         return client.name
--       end
--     end
--     return nil
--   end,
--   icon = ' ',
--   cond = function()
--     local clients = vim.lsp.get_clients()
--     return next(clients) ~= nil -- Only show this section if there are active LSP clients
--   end
-- }

require('lualine').setup(config)
