require('bufferline').setup({
  highlights = {
    buffer_visible = {
      bold = false,
      italic = false,
    },
    buffer_selected = {
      bold = false,
      italic = false,
    },
    numbers_visible = {
      bold = false,
      italic = false,
    },
    numbers_selected = {
      bold = false,
      italic = false,
    },
  },
  options = {
    indicator = {
      style = "icon",
      icon = "▎"
    },
    modified_icon = "●",
    buffer_close_icon = "",
    close_icon = "",
    left_trunc_marker = " ",
    right_trunc_marker = "",
    numbers = "ordinal",
    max_prefix_length = 6,
    diagnostics = "nvim_lsp",
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    persist_buffer_sort = true,
    enforce_regular_tabs = true,
    diagnostics_indicator = function(count, level)
      return level:match("error") and "" or ""
    end,
  },
})

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    require("bufferline").go_to_buffer(i, true)
  end)
end

vim.keymap.set("n", "<leader>bc", ":bd<CR>")

