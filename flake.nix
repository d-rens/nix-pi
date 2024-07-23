{
  description = "raspberry pi 5/server aarch_64 flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self, 
    nixpkgs,
    home-manager,
    sops-nix,
    ...
  }:
  let
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
      pi = lib.nixosSystem {
        system = "aarch_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          sops-nix.nixosModules.sops
          {
	    home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              sharedModules = [ 
                inputs.sops-nix.homeManagerModules.sops
              ];
	    };
          }
        ];
      };
    };
  };
}
