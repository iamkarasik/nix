{pkgs, ...}: {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraConfig = ''
    set runtimepath+=${./lua/themes}

    luafile ${./lua/theme.lua}
    luafile ${./lua/keymaps.lua}
    luafile ${./lua/settings.lua}
    luafile ${./lua/treesitter.lua}
    luafile ${./lua/lsp.lua}
    luafile ${./lua/telescope.lua}
    luafile ${./lua/nvim-tree.lua}
    luafile ${./lua/gitsigns.lua}
    luafile ${./lua/lualine.lua}
  '';

  extraPackages = with pkgs; [
    gopls # GoLang
    jdt-language-server # Java
    lua-language-server # Lua
    nil # Nix
    typescript-language-server # JavaScript/TypeScript
  ];

  plugins = with pkgs.vimPlugins; [
    melange-nvim 
    tokyonight-nvim
    vscode-nvim

    nvim-web-devicons

    lualine-nvim
    telescope-nvim
    nvim-tree-lua

    gitsigns-nvim
    nvim-treesitter.withAllGrammars
    nvim-ts-autotag

    nvim-lspconfig
  ];
}
