{
  description = "NixOS with Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-stable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations."ThinkPad-X280" = nixpkgs.lib.nixosSystem {
    # Make sure hostname is correct
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix

        # Connect Home Manager to your system rebuild chain
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.bruno = import ./home.nix;
        }
      ];
    };
  };
}
