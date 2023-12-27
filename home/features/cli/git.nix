{ pkgs, lib, ... }:
{
  home.packages = [ 
    pkgs.gh
  ];
  
  programs.git = {
    enable = lib.mkDefault true;

    extraConfig = {
      init.defaultBranch = lib.mkDefault "main";
      credential.helper = lib.mkDefault "!gh auth git-credential";
    };
  };
}
