{ config, inputs, ... }:

let 
    hostname  = config.networking.hostName;
in
{
  # Enable auto-upgrade service for system updates
  system.autoUpgrade = {
        enable = true;
        flake = inputs.self.outPath;  # Set your flake path here
        flags = [
            "--update-input"
            "nixpkgs"
            "-L"  # Print build logs
        ];
        dates = "daily";  # Time for the upgrade
        randomizedDelaySec = "45min";  # Random delay before upgrade
    };

  nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 7d";
	};
}
