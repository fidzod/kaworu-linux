{
  description = "kaworu linux - a nixos rice";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sysc-greet = {
      url = "github:Nomadcxx/sysc-greet";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, sysc-greet, stylix, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.kaworu = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/kaworu/configuration.nix
        sysc-greet.nixosModules.default
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
