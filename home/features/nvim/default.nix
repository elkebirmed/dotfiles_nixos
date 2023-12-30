{ pkgs, ... }: {
  imports = [
    ./settings.nix
    ./keybinding.nix
    ./plugins.nix
    ./lsp.nix
  ];

  home.file = {
    ".config/nvim/config" = {
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

    /*plugins = with pkgs.vimPlugins; [
      bufferline-nvim
      cmp_luasnip
      cmp-buffer
      cmp-cmdline
      cmp-dap
      cmp-nvim-lsp
      cmp-nvim-lsp-document-symbol
      cmp-path
      codeium-vim
      comment-nvim
      crates-nvim
      dressing-nvim
      editorconfig-nvim
      gitsigns-nvim
      indent-blankline-nvim
      leap-nvim
      lspkind-nvim
      lualine-nvim
      luasnip
      neo-tree-nvim
      nix-develop-nvim
      noice-nvim
      null-ls-nvim
      numb-nvim
      nvim_context_vt
      nvim-autopairs
      nvim-cmp
      nvim-colorizer-lua
      nvim-dap
      nvim-dap-ui
      nvim-lspconfig
      nvim-navic
      nvim-notify
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      playground
      refactoring-nvim
      ron-vim
      rust-tools-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      trouble-nvim
      typst-vim
      vim-fugitive
      vim-lastplace
      vim-surround
      vim-table-mode
      vim-visual-multi
    ];*/
  };
}
