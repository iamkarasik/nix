require('gitsigns').setup({
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'overlay', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
})

vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>');
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>');
