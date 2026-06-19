{
  description = "NixOS with Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catpuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, catpuccin, ... }@inputs: {
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
