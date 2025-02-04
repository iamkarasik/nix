local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    go = { "gofumpt" },
    java = { "google-java-format" },
    javascript = { "prettierd" },
    json = { "jq" },
    lua = { "stylua" },
    rust = { "rustfmt" },
    scala = { "scalafmt" },
    yaml = { "yq" }
  },
  formatters = {
    yq = {
      command = "yq",
      args = { "-y", "--indentless" }
    },
    jq = {
      command = "jq",
      args = {}
    }
  }
})

local format_fn = function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end

vim.keymap.set("n", "<leader>mp", format_fn, { desc = "Format File" })
