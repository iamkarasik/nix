local status, telescope = pcall(require, "telescope")
if not status then
    return
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
      prompt_prefix = "  ",
      selection_caret = "  ",
      path_display = { "smart" },

      mappings = {
          i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
          },
      },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {

      }
    }
  }
}

require("telescope").load_extension("ui-select")
