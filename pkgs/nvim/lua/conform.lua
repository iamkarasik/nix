local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },

    -- Conform will run multiple formatters sequentially
    python = { "black" },

    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt" },

    -- Conform will run the first available formatter
    javascript = { "prettierd" },

    java = { "google-java-format" },

    scala = { "scalafmt" },

    go = { "gofumpt" },
  },
})

local format_fn = function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end

vim.keymap.set("n", "<leader>mp", format_fn, { desc = "Format File" })
