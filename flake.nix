{
  description = "my nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spacebar.url = "github:cmacrae/spacebar/v1.4.0";
  };

  outputs = { self, nixpkgs, home-manager, darwin, spacebar }: {
    darwinConfigurations.Shreerams-Macbook-Air = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        home-manager.darwinModules.home-manager
        ./src/home.nix
        ./src/darwin.nix
      ];
    };
  };
}
