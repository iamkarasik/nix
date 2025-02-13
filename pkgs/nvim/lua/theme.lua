require("vscode").load("dark")
local c = require("vscode.colors").get_colors()

local vim = vim

local warnUnderline = "#be9117"
local customYellow = "#ffc66d"
local customGreen = "#3d8f7f"

vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = c.vscGray, bg = "NONE", undercurl = true, sp = warnUnderline })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = c.vscRed, bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = "NONE", bg = "NONE", undercurl = true, sp = warnUnderline })

vim.api.nvim_set_hl(0, "@constant.java", { fg = customYellow })
vim.api.nvim_set_hl(0, "@lsp.typemod.property.static.java", { fg = customYellow })
vim.api.nvim_set_hl(0, "@variable.parameter.java", { fg = c.vscYellow })
vim.api.nvim_set_hl(0, "@lsp.type.parameter.java", { fg = c.vscYellow })

vim.api.nvim_set_hl(0, "@lsp.typemod.property.readonly.java", { link = "@lsp" })
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.java", { link = "@lsp" })

vim.api.nvim_set_hl(0, "@lsp.typemod.method.static.java", { fg = c.vscFront })

vim.api.nvim_set_hl(0, "@keyword.conditional.java", { fg = c.vscBlue })
vim.api.nvim_set_hl(0, "@keyword.return.java", { fg = c.vscBlue })
vim.api.nvim_set_hl(0, "@keyword.import.java", { fg = c.vscBlue })

vim.api.nvim_set_hl(0, "@lsp.typemod.annotation.public.java", { fg = c.vscBlueGreen })

vim.api.nvim_set_hl(0, "@lsp.typemod.interface.public.java", { fg = customGreen })

vim.api.nvim_set_hl(0, "MiniCursorword", { bg = c.vscContext })
vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = c.vscContext })
