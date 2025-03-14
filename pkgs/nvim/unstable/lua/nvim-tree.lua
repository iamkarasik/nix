local function custom_on_attach(bufnr)
  local api = require("nvim-tree.api")
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.del('n', '<C-e>', { buffer = bufnr })
end

require("nvim-tree").setup({
  on_attach = custom_on_attach,
  hijack_cursor = true,
  disable_netrw = true,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    root_folder_label = function(path)
      local icon = " "
      return icon .. vim.fn.fnamemodify(path, ":t")
    end,
    highlight_git = "name",
    highlight_diagnostics = "name",
    highlight_opened_files = "name",
    highlight_modified = "name",
    highlight_hidden = "name",
    highlight_bookmarks = "name",
    highlight_clipboard = "name",
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        folder = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "󰆤",
        modified = "●",
        hidden = "󰜌",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
  git = {
    enable = false,
    ignore = false,
  },
  actions = {
    change_dir = {
      enable = false,
      restrict_above_cwd = true,
    },
  },
  filters = {
    dotfiles = false,
  },
})

vim.api.nvim_create_autocmd({"QuitPre"}, {
  callback = function() vim.cmd("NvimTreeClose") end,
})

vim.keymap.set({"i", "n"}, "<c-e>", "<Esc>:NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ec", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
