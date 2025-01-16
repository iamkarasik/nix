local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },

    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },

    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },

    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },

    java = { "google-java-format" },

    scala = { "scalafmt" },

    go = { "gofumpt" }
  },
})

local format = function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000
  })
end

vim.keymap.set("n", "<leader>mp", format)
