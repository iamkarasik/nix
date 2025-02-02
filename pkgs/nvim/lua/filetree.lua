local keymap = vim.keymap

keymap.set("n", "<c-e>", ":Neotree show toggle<CR>")
keymap.set("n", "<leader>ee", ":Neotree show toggle<CR>")
keymap.set("n", "<leader>ec", ":Neotree reveal<CR>")

require("neo-tree").setup({
  close_if_last_window = true,
  source_selector = {
    winbar = true, -- toggle to show selector on winbar
    content_layout = "center",
    tabs_layout = "equal",
    show_separator_on_edge = true,
    sources = {
      {source = "filesystem"},
    }
  },
  buffers = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
  },
  filesystem = {
    components = {
      name = function(config, node, state)
        local components = require('neo-tree.sources.common.components')
        local name = components.name(config, node, state)
        if node:get_depth() == 1 then
            name.text = vim.fs.basename(vim.loop.cwd() or '')
        end
        return name
      end
    },
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
      },
      never_show = {
        ".DS_Store",
        "thumbs.db"
      },
    },
  },
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      -- expander config, needed for nesting files
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander"
    },
  },
})
