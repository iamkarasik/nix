local lspconfig = require('lspconfig')

lspconfig['gopls'].setup { }
lspconfig['jdtls'].setup { }
lspconfig['lua_ls'].setup { }
lspconfig['nil_ls'].setup { }
lspconfig['ts_ls'].setup { }

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})
