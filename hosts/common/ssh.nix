{ config, lib, pkgs, inputs, ... }:

{
  services.openssh = {
    enable = lib.mkDefault true;
    openFirewall = lib.mkDefault true;

    settings = {
      X11Forwarding = lib.mkDefault true;
      PermitRootLogin = lib.mkDefault "no"; # disable root login
      PasswordAuthentication = lib.mkDefault false; # disable password login
    };
  };
}
