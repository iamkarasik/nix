M = {}

M.get = function()
    local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })

    if next(clients) == nil then
        return ""
    end

    local client_name = ""
    for _, client in ipairs(clients) do
        if client.name ~= "sonarqube" then
            client_name = client.name
            break
        end
    end

    if client_name == "" then
        return ""
    end

    local hl = "%#KlineLsp#"
    local txt = client_name
    return hl .. " " .. txt .. " %*"
end

return M
