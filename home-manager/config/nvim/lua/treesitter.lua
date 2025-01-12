require('nvim-treesitter.configs').setup{
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true
  },
  indent = {
    enable = true
  }
}
