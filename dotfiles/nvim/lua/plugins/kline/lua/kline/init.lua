local M = {}

M.render = function()
    return table.concat({
        require("kline.components.mode").get(),
        require("kline.components.git").get(),
        require("kline.components.filename").get(),
        "%=",
        require("kline.components.diagnostics").get(),
        require("kline.components.cursor").get(),
    })
end

-- TODO: use the passed config to customize the statusline
M.setup = function(_)
    local group = vim.api.nvim_create_augroup("Kline", { clear = true })

    vim.api.nvim_create_autocmd({
        "BufEnter",
        "BufWritePost",
        "CursorMoved",
        "CursorMovedI",
        "DiagnosticChanged",
        "FileChangedShellPost",
        "Filetype",
        "ModeChanged",
        "SessionLoadPost",
        "VimResized",
        "WinEnter",
    }, {
        group = group,
        callback = function()
            vim.cmd("redrawstatus")
        end,
    })

    vim.o.laststatus = 3
    vim.o.statusline = "%!v:lua.require('kline').render()"
end

return M
