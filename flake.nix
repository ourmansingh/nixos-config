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

    nixos-06cb-009a-fingerprint-sensor = {
      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, nur, nixos-hardware, nixos-06cb-009a-fingerprint-sensor, ... }@inputs: {
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
          nixos-06cb-009a-fingerprint-sensor.nixosModules.open-fprintd
          nixos-06cb-009a-fingerprint-sensor.nixosModules.python-validity
        ];
      };
    };

  };
}
