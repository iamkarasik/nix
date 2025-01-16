{ pkgs, lib, ... }:

{
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraConfig = ''
    luafile ${./lua/keymaps.lua}
    luafile ${./lua/settings.lua}
    luafile ${./lua/vscode.lua}
    luafile ${./lua/treesitter.lua}
    luafile ${./lua/toggleterm.lua}
    luafile ${./lua/telescope.lua}
    luafile ${./lua/autopairs.lua}
    luafile ${./lua/conform.lua}
    luafile ${./lua/cmp.lua}
    luafile ${./lua/file-trees/neotree.lua}
    luafile ${./lua/bufferline.lua}
    luafile ${./lua/lualine.lua}
    luafile ${./lua/colorizer.lua}
    luafile ${./lua/which-key.lua}
    luafile ${./lua/rainbow-delimiters.lua}
    luafile ${./lua/indent-blankline.lua}
    luafile ${./lua/gitsigns.lua}
    luafile ${./lua/lsp/lsp.lua}
    '';


  extraPackages = with pkgs; [
    black
    gofumpt
    google-java-format
    prettierd
    rustfmt
    sonarlint-ls
    scalafmt
    stylua
  ];

  plugins = with pkgs.vimPlugins; [
    # Themes
    vscode-nvim

    nvim-treesitter.withAllGrammars
    nvim-ts-autotag
    rainbow-delimiters-nvim

    nvim-web-devicons
    nvim-autopairs
    lualine-nvim
    toggleterm-nvim
    bufferline-nvim
    plenary-nvim
    telescope-nvim
    telescope-ui-select-nvim
    indent-blankline-nvim
    nvim-colorizer-lua

    # Util
    which-key-nvim

    # Git
    gitsigns-nvim

    # File Trees
    nui-nvim
    neo-tree-nvim

    # LSP
    lazy-lsp-nvim

    # Autocomplete
    nvim-cmp
    cmp-vsnip
    vim-vsnip
    cmp-nvim-lsp
    cmp-buffer

    conform-nvim
  ];
}
