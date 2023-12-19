{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  networking = {
    hostName = "crazy";
    networkmanager.enable = true;
    resolvconf.dnsExtensionMechanism = false;
    firewall.enable = false;
  };

  time.timeZone = "Africa/Algiers";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LANGUAGE = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
    supportedLocales = [ "all" ];
  };  

  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  services = {
    openssh.enable = true;

    xserver = {
      enable = true;
      layout = "fr";
      xkbVariant = "";
      displayManager.lightdm.enable = false;

      displayManager.sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
        theme = "sugar-catppuccin";

        settings = {
          autologin = {
            Session = "hyprland";
            User = "mohamed";
          };
        };
      };
    };
  };

  users.users.mohamed = {
    isNormalUser = true;
    description = "Mohamed Elkebir";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    curl
    git

    inputs.sddm-sugar-catppuccin.packages.${pkgs.system}.default
  ];

  programs = {
    zsh = {
      enable = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
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

