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
    luafile $HOME/.config/home-manager/config/nvim/lua/keymaps.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/settings.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/vscode.nvim/vscode.lua

    luafile $HOME/.config/home-manager/config/nvim/lua/treesitter.lua

    luafile $HOME/.config/home-manager/config/nvim/lua/toggleterm.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/telescope.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/autopairs.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/comment.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/cmp.lua

    luafile $HOME/.config/home-manager/config/nvim/lua/file-trees/neotree.lua

    luafile $HOME/.config/home-manager/config/nvim/lua/bufferline.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/lualine.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/colorizer.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/which-key.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/rainbow-delimiters.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/indent-blankline.lua

    luafile $HOME/.config/home-manager/config/nvim/lua/gitsigns.lua
    luafile $HOME/.config/home-manager/config/nvim/lua/lsp/lsp.lua
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
    nvim-comment
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
