{ pkgs, ... }: {
  imports = [
    ./gh.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    bat # Better cat
    eza # Better ls
    ripgrep # Better grep
    fd # Better find
    jq # JSON pretty printer and manipulator
    nh # Nice wrapper for NixOS and HM
  ];
}