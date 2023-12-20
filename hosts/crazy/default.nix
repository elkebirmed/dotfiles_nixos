{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/mohamed

    ../common/optional/ckb-next.nix
    ../common/optional/sddm.nix
    ../common/optional/pipewire.nix
  ];

  networking = {
    hostName = "crazy";
    networkmanager.enable = true;
    resolvconf.dnsExtensionMechanism = false;
    firewall.enable = false;
    # useDHCP = true;
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  boot = {
    # kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
    kdeconnect.enable = true;
  };

  services.hardware.openrgb.enable = true;

  hardware = {
    opengl.enable = true;
    opentabletdriver.enable = true;
  };

  system.stateVersion = "23.11";
}