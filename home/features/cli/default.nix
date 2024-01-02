{ pkgs, ... }: {
  imports = [
    ./git.nix
  ];

  home.packages = with pkgs; [
    # tools
    bat
    eza
    fd
    ripgrep
    fzf
    socat
    jq
    acpi
    inotify-tools
    ffmpeg
    libnotify
    killall
    zip
    unzip
    glib
    util-linux
    lazygit

    nh

    nodejs_21
    yarn
    typescript
    sassc
  ];
}
