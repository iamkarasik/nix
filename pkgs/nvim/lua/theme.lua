require('vscode').load('dark')
local c = require('vscode.colors').get_colors()

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { fg = c.vscRed, bg = 'NONE' })
