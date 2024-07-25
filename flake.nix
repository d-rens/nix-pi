{
  description = "raspberry pi 5/server aarch_64 flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      pi = nixpkgs.lib.nixosSystem {
        system = "aarch64";
        modules = [
          ./hosts/pi/configuration.nix
          home-manager.nixosModules.home-manager
          {
	    home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
	      users.pi = import ./home;
	    };
          }
        ];
      };
    };
  };
}
