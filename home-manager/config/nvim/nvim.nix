{ pkgs, lib, ... }:

let
  sonarlint-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "sonarlint.nvim";
    version = "1";
    src = pkgs.fetchFromGitLab {
      owner = "schrieveslaach";
      repo = "sonarlint.nvim";
      rev = "c3eef78f2496cefa07fbb7d0d25f6164f036c0bb";
      sha256 = "1fw7jkj96gk8wpwgb1yw87j7dv2ws7d31ahksjy1zazy4m1v9kmg";
    };
  };

  customSonarLint = import ../../../pkgs/sonarlint-language-server/derivation.nix { inherit pkgs; };
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
    luafile ${./lua/lsp/sonarlint.lua}
    '';


  extraPackages = with pkgs; [
    black
    gofumpt
    google-java-format
    prettierd
    rustfmt
    scalafmt
    stylua
    customSonarLint
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
    sonarlint-nvim

    # Autocomplete
    nvim-cmp
    cmp-vsnip
    vim-vsnip
    cmp-nvim-lsp
    cmp-buffer

    conform-nvim
  ];
}
