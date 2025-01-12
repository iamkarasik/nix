require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float'
})

vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=horizontal<CR>")
