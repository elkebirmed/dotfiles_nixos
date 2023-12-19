{ config, pkgs, inputs, lib, ... }:

{
  home.username = "mohamed";
  home.homeDirectory = "/home/mohamed";
  home.stateVersion = "23.11";

  noxpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bat
    fzf
    ripgrep
    jq
    tree
    exa
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionAliases = {
    l = "exa";
    ls = "exa";
    cat = "bat";
  };

  programs.zsh = {
    enable = true;
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "dpoggi";

    plugins = [
      "git"
      "python"
      "docker"
      "fzf"
      "sudo"
    ];
  };
}
