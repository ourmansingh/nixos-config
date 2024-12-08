{
  inputs = {
    nixpkgs= {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nixpkgs-23-11 = {
      url = "github:nixos/nixpkgs/nixos-23.11";
    };

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
      inputs.nixpkgs.follows = "nixpkgs-23-11";
    };

    stylix = {
      url = "github:danth/stylix";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, nixos-hardware, nixos-06cb-009a-fingerprint-sensor, hyprland, ... }@inputs: {
    nixosConfigurations = {
      qpc = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/qpc/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix
        ];
      };
      x280 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/x280/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix
          nixos-hardware.nixosModules.lenovo-thinkpad-x280
          nixos-06cb-009a-fingerprint-sensor.nixosModules.open-fprintd
          nixos-06cb-009a-fingerprint-sensor.nixosModules.python-validity
        ];
      };
    };

  };
}
