{ pkgs, ... }:
{
  home.packages = [ 
    pkgs.gh
  ];
  
  programs.git = {
    enable = true;
    userName = "Mohamed Elkebir";
    userEmail = "mohamedelkebir85@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";

      credential.helper = "!gh auth git-credential";
    };
  };
}
