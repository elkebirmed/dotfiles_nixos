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
      python311Packages.pynvim
      php82Packages.composer
      python311Packages.pip
    ];

    plugins = with pkgs.vimPlugins; [
      tokyonight-nvim
      nvim-lspconfig

      nvim-treesitter-parsers.lua
    ];
  };
}
