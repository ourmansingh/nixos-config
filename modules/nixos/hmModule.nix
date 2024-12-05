{ config, lib, inputs, ... }:

let
  cfg = config.hmModule;
  hostname = config.networking.hostName;
  
  homeNixPath = if hostname == "qpc" then ../../hosts/qpc/home.nix
                else if hostname == "x280" then ../../hosts/x280/home.nix
                else null;
  plasmaManagerModule = inputs.plasma-manager.homeManagerModules.plasma-manager;
in
{
  options.hmModule = {
    enable = lib.mkEnableOption "Enable Home Manager module";

    username = lib.mkOption {
      type = lib.types.str;
      default = "rhf";  
      description = "The username for Home Manager configuration.";
    };
  };

  # Apply configuration based on the options
  config = lib.mkIf cfg.enable {
    
    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      backupFileExtension = "hbk";
      sharedModules = [ plasmaManagerModule ];
      users.${cfg.username} = {
        imports = lib.optionalAttrs (homeNixPath != null) [ homeNixPath ];
      };
    };
  };
}
