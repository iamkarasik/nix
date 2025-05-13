{pkgs, ...}: let
  sonarqube-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "sonarqube.nvim";
    version = "1";
    src = pkgs.fetchFromGitHub {
      owner = "iamkarasik";
      repo = "sonarqube.nvim";
      rev = "9a911801f64bd20c8d6ea885a83ff8e7692a1bc3";
      sha256 = "0mxw728j541ipa8gps1a2an6k2ql8d25byp521zyffzjh4dlpsi5";
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
    luafile ${./lua/noice.lua}
    luafile ${./lua/notify.lua}
    luafile ${./lua/mini-cursorword.lua}
    luafile ${./lua/indent-blankline.lua}
    luafile ${./lua/autopairs.lua}
    luafile ${./lua/keymaps.lua}
    luafile ${./lua/settings.lua}
    luafile ${./lua/treesitter.lua}
    luafile ${./lua/lsp.lua}
    luafile ${./lua/sonarqube.lua}
    luafile ${./lua/nvim-cmp.lua}
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

    # Debug
    delve
  ];

  plugins = with pkgs.vimPlugins; [
    noice-nvim
    nvim-notify
    nvim-web-devicons
    indent-blankline-nvim
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

    nvim-cmp
    cmp-buffer
    cmp-nvim-lsp
    cmp-cmdline
    cmp-nvim-lsp-signature-help
    cmp-path

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
