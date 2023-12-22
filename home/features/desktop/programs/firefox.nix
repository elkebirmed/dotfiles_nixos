{ pkgs, inputs, config, lib, ... }: {
  programs.brave = {
    enable = true;
  };

  programs.firefox = {
    enable = true;
  };
}
