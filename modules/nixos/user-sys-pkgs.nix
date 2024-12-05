{ config, pkgs, ... }:

let 
    hostname  = config.networking.hostName;
in
{
  environment.systemPackages = with pkgs; [ 
    syncthing 
    (if hostname == "qpc" then mullvad-vpn else protonvpn-gui)
  ];

  #Syncthing
  services.syncthing = {
	  enable = true;
	  user = (if hostname == "qpc" then "rhf" else "asingh");
	  group = "users";
  };
}  
