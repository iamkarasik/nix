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

  kline-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "kline";
    src = ../../dotfiles/nvim/lua/plugins/kline;
  };

  themes-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "themes";
    src = ../../dotfiles/nvim/lua/plugins/themes;
    # The require check loads each module standalone, without the colorscheme
    # plugins these call into on the runtimepath.
    doCheck = false;
  };

  cursor-dark = pkgs.vimUtils.buildVimPlugin {
    pname = "cursor-dark.nvim";
    version = "1";
    src = pkgs.fetchFromGitHub {
      owner = "bergholmm";
      repo = "cursor-dark.nvim";
      rev = "68997e3e1abdc7fed34bd9fe53a9c6cf6229fd1e";
      sha256 = "0qv6z044gwwacc8fqrm24gfw17kk9ma6m42pbsdmpbklqkaf4b1d";
    };
  };

  ring0-dark = pkgs.vimUtils.buildVimPlugin {
    pname = "ring0-dark.nvim";
    version = "1";
    src = pkgs.fetchFromGitHub {
      owner = "xLeapProtocol";
      repo = "ring0-dark.nvim";
      rev = "17d7ec13e2a4b9167aac1ee8f249cb783249c821";
      sha256 = "0xyvl870x2aiw33bd29hnfja909q4g3mygw2f6i1b6dc9ghhly20";
    };
  };
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = ''
      set runtimepath+=${../../dotfiles/nvim/lua/autoload}

      luafile ${../../dotfiles/nvim/lua/core/settings.lua}
      luafile ${../../dotfiles/nvim/lua/core/keymaps.lua}
      luafile ${../../dotfiles/nvim/lua/core/lsp.lua}

      luafile ${../../dotfiles/nvim/lua/plugins/bufferline.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/which-key.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/notify.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/indent-blankline.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/virt-column.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/autopairs.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/treesitter.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/sonarqube.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/blink-cmp.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/fzf.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/nvimtree.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/gitsigns.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/toggleterm.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/conform.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/colorizer.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/rainbow-delimiters.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/dap.lua}
      luafile ${../../dotfiles/nvim/lua/plugins/neotest.lua}

      luafile ${../../dotfiles/nvim/lua/plugins/kline.lua}
      lua require("themes")
    '';

    plugins = with pkgs.vimPlugins; [
      vscode-nvim
      kanagawa-nvim
      tokyonight-nvim
      oxocarbon-nvim
      cursor-dark
      ring0-dark

      bufferline-nvim

      which-key-nvim
      nvim-notify
      nvim-web-devicons
      indent-blankline-nvim
      virt-column-nvim
      nvim-colorizer-lua
      rainbow-delimiters-nvim

      kline-nvim
      themes-nvim

      fzf-lua
      nvim-tree-lua
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
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  xdg.configFile = {
    "nvim/snippets".source = ../../dotfiles/nvim/snippets;
  };
}
