{pkgs, ...}: {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraConfig = ''
    luafile ${./lua/keymaps.lua}
    luafile ${./lua/settings.lua}
    luafile ${./lua/treesitter.lua}
    luafile ${./lua/lsp.lua}
    luafile ${./lua/telescope.lua}
    luafile ${./lua/lualine.lua}
    luafile ${./lua/theme.lua}
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

    nvim-treesitter.withAllGrammars
    nvim-ts-autotag

    telescope-nvim

    lualine-nvim

    nvim-lspconfig
  ];
}
