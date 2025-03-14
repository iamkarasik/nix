require('nvim-treesitter.configs').setup{
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}

require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false
  },
  per_filetype = {
    -- ["html"] = {
    --   enable_close = true
    -- }
  }
})
