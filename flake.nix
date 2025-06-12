{
  description = "NixOS with WSL + Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/nixos-wsl";
  };

  outputs = { self, nixpkgs, home-manager, nixos-wsl, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.haiminh256 = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        nixos-wsl.nixosModules.wsl
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.haiminh256 = import ./home.nix;
        }
      ];
    };
  };
}

