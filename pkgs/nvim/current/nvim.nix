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

    luafile ${./lua/core/settings.lua}
    luafile ${./lua/core/keymaps.lua}
    luafile ${./lua/core/lsp.lua}

    luafile ${./lua/plugins/theme.lua}
    luafile ${./lua/plugins/which-key.lua}
    luafile ${./lua/plugins/notify.lua}
    luafile ${./lua/plugins/indent-blankline.lua}
    luafile ${./lua/plugins/virt-column.lua}
    luafile ${./lua/plugins/autopairs.lua}
    luafile ${./lua/plugins/treesitter.lua}
    luafile ${./lua/plugins/sonarqube.lua}
    luafile ${./lua/plugins/blink-cmp.lua}
    luafile ${./lua/plugins/telescope.lua}
    luafile ${./lua/plugins/neo-tree.lua}
    luafile ${./lua/plugins/gitsigns.lua}
    luafile ${./lua/plugins/lualine.lua}
    luafile ${./lua/plugins/barbar.lua}
    luafile ${./lua/plugins/toggleterm.lua}
    luafile ${./lua/plugins/conform.lua}
    luafile ${./lua/plugins/colorizer.lua}
    luafile ${./lua/plugins/rainbow-delimiters.lua}
    luafile ${./lua/plugins/dap.lua}
    luafile ${./lua/plugins/neotest.lua}
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
    base16-nvim

    which-key-nvim
    nvim-notify
    nvim-web-devicons
    indent-blankline-nvim
    virt-column-nvim
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
