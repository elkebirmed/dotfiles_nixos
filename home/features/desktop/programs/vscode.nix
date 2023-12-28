{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
  };

  home.packages = with pkgs; [
    codeium
  ];
}
