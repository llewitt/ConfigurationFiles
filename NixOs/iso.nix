{ config, pkgs, lib, ... }:
{
    imports = [
		./hardware-configuration.nix
        ./lucy.nix
        ./home-manager.nix
        ./nfs.nix
        ./samba.nix
        ./laptop-server.nix
        <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
  
        # Provide an initial copy of the NixOS channel so that the user
        # doesn't need to run "nix-channel --update" first.
        <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
    ];

	# networking.hostName = "nixos"; # Define your hostname.
	# networking.wireless.enable = true;	# Enables wireless support via wpa_supplicant.

	time.timeZone = "Europe/London";

	# The global useDHCP flag is deprecated, therefore explicitly set to false here.
	# Per-interface useDHCP will be mandatory in the future, so this generated config
	# replicates the default behaviour.
	networking.useDHCP = false;
	networking.interfaces.enp0s25.useDHCP = true;
	networking.interfaces.wlp3s0.useDHCP = true;

	# Select internationalisation properties.
	# i18n.defaultLocale = "en_US.UTF-8";
	# console = {
	#	 font = "Lat2-Terminus16";
	#	 keyMap = "us";
	# };

    xdg.portal.enable = true;
	services.flatpak.enable = true;

	environment.systemPackages = with pkgs; [
		vim
		tmux
		wget
		git
     	flatpak
     	jq
        zsh
	];

	services.openssh.enable = true;

	system.stateVersion = "21.11"; # Did you read the comment?
}

