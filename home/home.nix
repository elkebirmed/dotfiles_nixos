{ config, pkgs, inputs, lib, ... }:

{
  home.username = "mohamed";
  home.homeDirectory = "/home/mohamed";
  home.stateVersion = "23.11";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.home-manager.enable = true;

  programs.alacritty.enable = true;
  programs.firefox.enable = true;
  programs.vscode.enable = true;
  programs.gh.enable = true;

  home.packages = with pkgs; [
    bat
    fzf
    ripgrep
    jq
    tree
    eza
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod SHIFT, Return, exec, alacritty"
        "$mod SHIFT, Q, exit"
        "$mod SHIFT, C, killactive"
        "$mod, V, togglefloating"
        "$mod, UP, fullscreen, 1"
        ",F11, fullscreen"
        "ALT, TAB, cyclenext"
      ];
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    l = "eza";
    ls = "eza";
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
