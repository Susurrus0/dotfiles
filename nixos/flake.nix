{
  description = "ThinkPad X280 Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations."ThinkPad-X280" = nixpkgs.lib.nixosSystem {
    # Make sure hostname is correct
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        # Connect Home Manager to your system rebuild chain
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.bruno = import ./home.nix;
        }
      ];
    };
  };
}
