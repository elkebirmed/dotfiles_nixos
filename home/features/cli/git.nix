{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Mohamed Elkebir";
    userEmail = "mohamedelkebir85@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}