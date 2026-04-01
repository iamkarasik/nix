local M = {}

---@class ModeInfo
---@field [1] string mode      -- canonical mode name
---@field [2] string highlight -- highlight group
---@field [3] string text      -- short display label
---@type table<string, ModeInfo>
local modes = {
    ["n"] = { "NORMAL", "Normal", "Normal" },
    ["no"] = { "NORMAL", "Normal", "Normal" },
    ["nov"] = { "NORMAL", "Normal", "Normal" },
    ["noV"] = { "NORMAL", "Normal", "Normal" },
    ["niI"] = { "NORMAL", "Normal", "Normal" },
    ["niR"] = { "NORMAL", "Normal", "Normal" },
    ["niV"] = { "NORMAL", "Normal", "Normal" },
    ["noCTRL-V"] = { "NORMAL", "Normal", "Normal" },

    ["v"] = { "VISUAL", "Visual", "Visual" },
    ["vs"] = { "VISUAL", "Visual", "Visual" },
    ["V"] = { "V-LINE", "Visual", "Visual" },
    ["Vs"] = { "V-LINE", "Visual", "Visual" },
    [""] = { "V-BLOCK", "Visual", "Visual" },

    ["i"] = { "INSERT", "Insert", "Insert" },
    ["ic"] = { "INSERT", "Insert", "Insert" },
    ["ix"] = { "INSERT", "Insert", "Insert" },
    ["s"] = { "SELECT", "Insert", "Insert" },
    ["S"] = { "S-LINE", "Insert", "Insert" },

    ["c"] = { "COMMAND", "Command", "Command" },
    ["cv"] = { "COMMAND", "Command", "Command" },
    ["ce"] = { "COMMAND", "Command", "Command" },
    ["cr"] = { "COMMAND", "Command", "Command" },

    ["R"] = { "REPLACE", "Replace", "Replace" },
    ["Rc"] = { "REPLACE", "Replace", "Replace" },
    ["Rx"] = { "REPLACE", "Replace", "Replace" },
    ["Rvc"] = { "REPLACE", "Replace", "Replace" },
    ["Rvx"] = { "REPLACE", "Replace", "Replace" },

    ["t"] = { "TERMINAL", "Other", "?" },
    ["nt"] = { "TERMINAL", "Other", "?" },
    ["ntT"] = { "TERMINAL", "Other", "?" },
    [""] = { "S-BLOCK", "Other", "?" },
    ["r"] = { "PROMPT", "Other", "?" },
    ["rm"] = { "MORE", "Other", "?" },
    ["r?"] = { "CONFIRM", "Other", "?" },
    ["x"] = { "CONFIRM", "Other", "?" },
    ["!"] = { "SHELL", "Other", "?" },
}

local get_mode_info = function()
    local mode = vim.api.nvim_get_mode().mode
    return modes[mode]
end

M.get = function()
    local mode_info = get_mode_info() or { "UNKNOWN", "Other", "?" }
    local hl = "%#KlineMode" .. mode_info[2] .. "#"
    return hl .. " " .. mode_info[3]:sub(1, 1) .. " %*"
end

return M
