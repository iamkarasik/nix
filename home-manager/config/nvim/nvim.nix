{ pkgs, lib, ... }:

let
  theme-vscode = pkgs.vimUtils.buildVimPlugin {
    pname = "vscode.nvim";
    version = "1";
    rev = "18097b7"; # The latest commit
    src = pkgs.lib.cleanSource ./lua/vscode.nvim;
  };
in
{
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraConfig = ''
    luafile ${./lua/keymaps.lua}
    luafile ${./lua/settings.lua}
    luafile ${./lua/vscode.nvim/vscode.lua}

    luafile ${./lua/treesitter.lua}

    luafile ${./lua/toggleterm.lua}
    luafile ${./lua/telescope.lua}
    luafile ${./lua/autopairs.lua}
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
  ];

  plugins = with pkgs.vimPlugins; [
    theme-vscode

    nvim-treesitter.withAllGrammars
    nvim-ts-autotag
    rainbow-delimiters-nvim

    rose-pine
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
    onedarkpro-nvim

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
  ];
}
