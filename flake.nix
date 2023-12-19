{
  description = "Mohamed's NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sddm-sugar-catppuccin = {
      url = "github:TiagoDamascena/sddm-sugar-catppuccin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: {
    nixosConfigurations = {
      crazy = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/crazy/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "mohamed@crazy" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
	      extraSpecialArgs = { inherit inputs; };

        modules = [
          ./home/home.nix
          hyprland.homeManagerModules.default
          {wayland.windowManager.hyprland = {
            enable = true;
            xwayland.enable = true;
            systemd.enable = true;
          };}
	      ];
      };
    };
  };
}
