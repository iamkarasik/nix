vim.g.mapleader = " "

local keymap = vim.keymap

-- clear highlight
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- don't copy to register on x
keymap.set("n", "x", '"_x')

-- shift selection
keymap.set("v", "<", "<gv");
keymap.set("v", ">", ">gv");
keymap.set("n", "J", "mzJ`z")

-- Keep cursor in center when doing Ctrl+D/Ctrl+U
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in center when finding search terms
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- change window with ctrl+hjkl
keymap.set("n", "<c-l>", "<c-w>l")
keymap.set("n", "<c-h>", "<c-w>h")
keymap.set("n", "<c-k>", "<c-w>k")
keymap.set("n", "<c-j>", "<c-w>j")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
