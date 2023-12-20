{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    extensions = with pkgs; [ gh-markdown-preview ];
    settings = {
      version = "1";
      git_protocol = "https";
      prompt = "enabled";
    };
  };
  home.persistence = {
    "/persist/home/mohamed".directories = [ ".config/gh" ];
  };
}
