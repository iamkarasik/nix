require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
})

vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>")
