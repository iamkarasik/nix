M = {}

local excluded_filenames = {
    ["NvimTree_1"] = true,
    ["sh"] = true,
}

M.get = function()
    local filename = vim.fn.expand("%:t")
    if excluded_filenames[filename] then
        return ""
    end

    local hl = "%#KlineFilename#"
    return hl .. " " .. filename .. " %*"
end

return M
