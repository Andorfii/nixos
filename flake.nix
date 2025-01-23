{
  description = "Leon's Nix Config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # Nixpkgs 24.05 Revision 5a83f6f98
    nixpkgs-5a83f6f98.url = "git+https://github.com/NixOS/nixpkgs/?ref=nixos-24.05&rev=5a83f6f984f387d47373f6f0c43b97a64e7755c0";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # Catppuccin
    catppuccin.url = "github:catppuccin/nix";

    # Nixvim
    nixvim.url = "github:nix-community/nixvim";

  };

  outputs = inputs@{ nixpkgs, nixpkgs-5a83f6f98, home-manager, plasma-manager, catppuccin, nixvim, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = {
	  pkgs-5a83f6f98 = import nixpkgs { system = "x86_64-linux"; };
	};
        modules = [
          ./system
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [
	      catppuccin.homeManagerModules.catppuccin
	      plasma-manager.homeManagerModules.plasma-manager
	      nixvim.homeManagerModules.nixvim
            ];
            home-manager.users.eviltrtl = import ./home;
          }
        ];
      };
    };
  };
}
