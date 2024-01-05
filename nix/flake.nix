# /etc/nixos/flake.nix
{
  description = "flake for nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-ld, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      #nixos host
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          nix-ld.nixosModules.nix-ld
          #{
          #  programs.nixosModules.nix-ld.dev.enable = true;
          #}

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    #home-manager.users.nixos = ./home/cdaron/home.nix;
	    home-manager.users.cdaron = { pkgs, ... }: {
            home.username = "cdaron";
              home.homeDirectory = "/home/cdaron";
              programs.home-manager.enable = true;
              home.stateVersion = "23.11";
            };
	  }
        ];
      };
    };
  };
  
}

