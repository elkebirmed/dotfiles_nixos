{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  users.users.mohamed = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "networkmanager"
      "mysql"
      "docker"
      "podman"
      "git"
      "libvirtd"
    ];

    # openssh.authorizedKeys.keys = [ (builtins.readFile ../../../../home/mohamed/ssh.pub) ];
    # hashedPasswordFile = config.sops.secrets.mohamed-password.path;
    packages = with pkgs; [
      home-manager
      gh
    ];
  };

  # sops.secrets.mohamed-password = {
  #   sopsFile = ../../secrets.yaml;
  #   neededForUsers = true;
  # };

  home-manager.users.mohamed = import ../../../../home/mohamed/${config.networking.hostName}.nix;
}
