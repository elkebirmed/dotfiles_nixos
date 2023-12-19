{
  description = "Mohamed's NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { self, nixpkgs, home-manager }@inputs: {
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
	];
      };
    };
  };
}
