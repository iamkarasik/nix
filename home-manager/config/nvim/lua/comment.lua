require('nvim_comment').setup()

vim.keymap.set("n", "<c-_>", ":CommentToggle<CR>")
vim.keymap.set("i", "<c-_>", "<ESC>:CommentToggle<CR>")
vim.keymap.set("v", "<c-_>", ":CommentToggle<CR>gv")
