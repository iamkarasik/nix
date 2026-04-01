M = {}

local icon = " "

M.get = function()
    local branch = vim.g.gitsigns_head

    if branch == nil or branch == "" then
        return ""
    end

    local hl = "%#KlineBranch#"
    local txt = icon .. branch
    return hl .. " " .. txt .. " %*"
end

return M
