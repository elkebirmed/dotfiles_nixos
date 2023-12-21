{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      inputs.hardware.nixosModules.common-cpu-amd
      inputs.hardware.nixosModules.common-gpu-amd
      inputs.hardware.nixosModules.common-pc-ssd
      
      ./hardware-configuration.nix

      ../common

      ../optional/fonts.nix
      ../optional/greeter.nix
      ../optional/pipewire.nix
    ];

  users.users.mohamed = {
    isNormalUser = true;
    description = "Mohamed Elkebir";
    
    extraGroups = [
      "wheel" 
      "networkmanager"
      "video"
      "audio"
      "mysql"
      "docker"
      "podman"
      "libvirtd"
      ];
      
    packages = with pkgs; [
      home-manager
    ];
  };

  home-manager.users.mohamed = import ../../../home/mohamed/${config.networking.hostName}.nix;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "crazy";
    firewall.enable = false;
  };

  time.timeZone = "Africa/Algiers";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "ar_DZ.UTF-8"; # Adresse
      LC_IDENTIFICATION = "ar_DZ.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "ar_DZ.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "ar_DZ.UTF-8";
      LC_TELEPHONE = "ar_DZ.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
    
    supportedLocales = [ "all" ];
  };  

  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  services.printing.enable = true;

  programs = {
    adb.enable = true;
    dconf.enable = true;
    kdeconnect.enable = true;
  };

  hardware = {
    opengl.enable = true;
    opentabletdriver.enable = true;
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}
