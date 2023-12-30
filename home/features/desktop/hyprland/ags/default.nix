{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    sassc
    (python311.withPackages (p: [ p.python-pam ]))
  ];

  programs.ags = {
    enable = true;
    configDir = ./config;

    extraPackages = with pkgs; [
      libgtop
      libsoup_3
    ];
  };
}
