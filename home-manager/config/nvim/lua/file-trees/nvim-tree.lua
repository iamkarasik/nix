vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = false,
    icons = {
      git_placement = "after",
    },
  },
  filters = {
    dotfiles = true,
  },
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
