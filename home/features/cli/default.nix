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

    nh

    nil
    nixfmt
    nixpkgs-fmt
    nvd
    nix-output-monitor
    stylua
    ltex-ls

    nodejs_21
    yarn
    typescript
    sassc
  ];
}
