{
  description = "My System Configurations";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";

    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, darwin, home-manager, neovim-nightly-overlay, ... }:
  let
    inherit (darwin.lib) darwinSystem;

    nixpkgsConfig = {
      config = { allowUnfree = true; };
      overlays = [ neovim-nightly-overlay.overlay ];
    };
  in
  {
    darwinConfigurations = {
      bienjensu = darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./darwin
          {
            networking.computerName = "Bienjensu";
            networking.hostName = "bienjensu";
          }
          home-manager.darwinModules.home-manager
          {
            nixpkgs = nixpkgsConfig;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nick = import ./home.nix;
          }
        ];
      };
    };

    defaultPackage.aarch64-darwin = self.darwinConfigurations.bienjensu.system;
  };
}
