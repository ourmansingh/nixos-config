{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
        url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:nixos/nixos-hardware/master";
    };

    x280-fprint = {
      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, nur, nixos-hardware, x280-fprint, ... }@inputs: {
    nixosConfigurations = {
      qpc = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/qpc/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      x280 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/x280/configuration.nix
          inputs.home-manager.nixosModules.default
          nixos-hardware.nixosModules.lenovo-thinkpad-x280
          x280-fprint.nixosModules.open-fprintd
          x280-fprint.nixosModules.python-validity
        ];
      };
    };

  };
}
