{ pkgs, ... }: {
  imports = [
    ./git.nix
  ];

  home.packages = with pkgs; [
    bat # Better cat
    eza # Better ls
    ripgrep # Better grep
    fd # Better find
    jq # JSON pretty printer and manipulator

    nil # Nix LSP
    nixfmt # Nix formatter
    # nvd # Differ
    # nix-output-monitor
    nh # Nice wrapper for NixOS and HM

    # ltex-ls # Spell checking LSP

    nodejs_21 # NodeJS
    yarn # NodeJS package manager

    sassc # SCSS preprocessor
  ];
}
