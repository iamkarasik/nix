{pkgs, ...}: let
  sonarqube-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "sonarqube.nvim";
    version = "1";
    src = pkgs.fetchFromGitHub {
      owner = "iamkarasik";
      repo = "sonarqube.nvim";
      rev = "1cf3ae2afb24b17d9c5b6dd8b556eaf0ce487779";
      sha256 = "0s5r9kbqxaj0i7pxlw6g4r71qzcy7x1ly4czjn7zv39np6z4igqa";
    };
  };
in {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraConfig = ''
    set runtimepath+=${./lua/autoload}

    luafile ${./lua/theme.lua}
    luafile ${./lua/which-key.lua}
    luafile ${./lua/notify.lua}
    luafile ${./lua/mini-cursorword.lua}
    luafile ${./lua/indent-blankline.lua}
    luafile ${./lua/virt-column.lua}
    luafile ${./lua/autopairs.lua}
    luafile ${./lua/keymaps.lua}
    luafile ${./lua/settings.lua}
    luafile ${./lua/treesitter.lua}
    luafile ${./lua/lsp.lua}
    luafile ${./lua/sonarqube.lua}
    luafile ${./lua/blink-cmp.lua}
    luafile ${./lua/telescope.lua}
    luafile ${./lua/neo-tree.lua}
    luafile ${./lua/gitsigns.lua}
    luafile ${./lua/lualine.lua}
    luafile ${./lua/barbar.lua}
    luafile ${./lua/toggleterm.lua}
    luafile ${./lua/conform.lua}
    luafile ${./lua/colorizer.lua}
    luafile ${./lua/rainbow-delimiters.lua}
    luafile ${./lua/dap.lua}
    luafile ${./lua/neotest.lua}
  '';

  extraPackages = with pkgs; [
    # LSP
    gopls # GoLang
    jdt-language-server # Java
    lua-language-server # Lua
    nil # Nix
    typescript-language-server # JavaScript/TypeScript

    # Formatters
    gofumpt
    google-java-format
    prettierd
    rustfmt
    scalafmt
    stylua
    alejandra
    sql-formatter

    # Debug
    delve
  ];

  plugins = with pkgs.vimPlugins; [
    which-key-nvim
    nvim-notify
    nvim-web-devicons
    indent-blankline-nvim
    virt-column-nvim
    mini-cursorword
    nvim-colorizer-lua
    rainbow-delimiters-nvim
    lualine-nvim
    barbar-nvim

    telescope-nvim
    telescope-ui-select-nvim
    neo-tree-nvim
    toggleterm-nvim

    nvim-treesitter.withAllGrammars
    nvim-ts-autotag
    nvim-autopairs
    vim-surround
    vim-sleuth

    gitsigns-nvim

    # Fugitive
    vim-fugitive
    vim-rhubarb
    fugitive-gitlab-vim

    sonarqube-nvim
    nvim-lspconfig
    conform-nvim

    blink-cmp

    # Debug
    nvim-dap
    nvim-dap-ui
    nvim-dap-virtual-text
    nvim-dap-go
    one-small-step-for-vimkind

    # Java
    nvim-jdtls

    # Testing
    neotest
    neotest-java
    neotest-go
  ];
}
