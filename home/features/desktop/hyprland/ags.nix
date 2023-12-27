{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    sassc
    (python311.withPackages (p: [ p.python-pam ]))
  ];

  programs.ags = {
    enable = true;
    
    # null or path, leave as null if you don't want hm to manage the config
    configDir = ./ags;

    # packages to add to gjs's runtime
    extraPackages = [ 
      pkgs.libgtop
      pkgs.libsoup_3
    ];
  };
}
