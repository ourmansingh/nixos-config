{ config, pkgs, ... }:

let 
  hostname = config.networking.hostName;
  # Define the list of packages to install
  packages = with pkgs; [
    syncthing
    (if hostname == "x280" then pkgs.protonvpn-gui else null)
  ];

  # Remove the null value from the list of packages
  finalPackages = builtins.filter (pkg: pkg != null) packages;
in
{
  environment.systemPackages = finalPackages;

  # Conditionally enable Mullvad VPN if hostname is "qpc"
  services.mullvad-vpn = if hostname == "qpc" then {
    enable = true;
    package = pkgs.mullvad-vpn;
  } else null;

  # Syncthing service configuration
  services.syncthing = {
    enable = true;
    user = if hostname == "qpc" then "rhf" else "asingh";
    group = "users";
  };
}
