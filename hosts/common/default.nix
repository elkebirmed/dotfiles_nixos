{ lib, pkgs, inputs, outputs, ... }:

{
  imports =
    [
      ./nix-ld.nix
      ./ssh.nix
    ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than +5";
  };

  # Add each flake input as a registry
  # To make nix3 commands consistent with the flake
  nix.registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

  # Add nixpkgs input to NIX_PATH
  # This lets nix2 commands still use <nixpkgs>
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];

  # Allow unfree packages
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config.allowUnfree = lib.mkDefault true;
  };

  networking = {
    networkmanager.enable = lib.mkDefault true;
    resolvconf.dnsExtensionMechanism = lib.mkDefault false;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    curl
    git
    gccgo
    rust-bin.stable.latest.default
  ];

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
