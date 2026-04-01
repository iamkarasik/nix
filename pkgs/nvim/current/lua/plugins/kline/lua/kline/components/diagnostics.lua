M = {}

M.get = function()
    if not vim.diagnostic or not vim.diagnostic.count then
        return ""
    end

    local counts = vim.diagnostic.count(0)

    local severities = {
        { id = vim.diagnostic.severity.ERROR, name = "Error", icon = "" },
        { id = vim.diagnostic.severity.WARN, name = "Warn", icon = "" },
        { id = vim.diagnostic.severity.INFO, name = "Info", icon = "" },
    }

    local info_count = (counts[vim.diagnostic.severity.INFO] or 0)
        + (counts[vim.diagnostic.severity.HINT] or 0)

    local diagnostics = ""

    for _, sev in ipairs(severities) do
        local n = (sev.id == vim.diagnostic.severity.INFO) and info_count or (counts[sev.id] or 0)
        if n > 0 then
            local hl = "%#Diagnostic" .. sev.name .. "#"
            local txt = hl .. sev.icon .. " " .. n .. " %*"
            diagnostics = diagnostics .. txt
        end
    end

    return diagnostics
end

return M
