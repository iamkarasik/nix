local status, telescope = pcall(require, "telescope")
if not status then
    return
end

local builtin = require('telescope.builtin')
local keymap = vim.keymap
keymap.set('n', '<c-f>', builtin.find_files, {})
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fs', builtin.live_grep, {})

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
      prompt_prefix = "  ",
      selection_caret = " ",
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
