{
  description = "Kaworu Linux - A NixOS Rice";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/thinkpad/configuration.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.fidzod = import ./home.nix;
        }
      ];
    };
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/vm/configuration.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.fidzod = import ./home.nix;
        }
      ];
    };
  };
}
