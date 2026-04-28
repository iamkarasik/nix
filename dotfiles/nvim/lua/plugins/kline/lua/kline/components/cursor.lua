M = {}

local icon = ""

M.get = function()
    local icon_segment = "%#KlineCursorIcon# " .. icon .. " "

    local txt = vim.fn.line(".") .. ":" .. vim.fn.col(".")
    local txt_segment = "%#KlineCursorText# " .. txt

    return icon_segment .. txt_segment .. " %*"
end

return M
