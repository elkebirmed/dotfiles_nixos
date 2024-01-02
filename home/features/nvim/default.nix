{ pkgs, ... }: {
  home.file = {
    ".config/nvim" = {
      source = ./config;
      recursive = true;
    };
  };

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    extraPackages = with pkgs; [
      gnumake
      cargo
      gcc13
      unzip
      wget
      curl
      tree-sitter
      luajitPackages.luarocks

      vscode-langservers-extracted
      dockerfile-language-server-nodejs
      docker-compose-language-service
      nixd
      rnix-lsp
      statix
      nil
      lua-language-server

      python311Packages.pynvim
      python311Packages.pip

      php82Packages.composer

      nodePackages.pyright
      nodePackages.typescript-language-server
      nodePackages.bash-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      neo-tree-nvim
      plenary-nvim
      nui-nvim
      nvim-web-devicons
      image-nvim
      nvim-window-picker
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      tokyonight-nvim
      lualine-nvim
      lualine-lsp-progress
      lspsaga-nvim
      nvim-lightbulb
      lspkind-nvim
      nvim-cmp
    ];
  };
}
