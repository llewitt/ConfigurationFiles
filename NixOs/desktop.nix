{ config, pkgs, ... }:
let
	mod = "Mod4";
in {
	services.xserver.windowManager.i3 = {
		enable = true;
		extraPackages = with pkgs; [
			dmenu
			i3status
			i3lock
		];
		package = pkgs.i3;
	};
};

