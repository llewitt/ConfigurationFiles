{ config, pkgs, ...}:
{
	users.users.lucy = {
		isNormalUser = true;
		extraGroups = [ "wheel" "dialout" ]; # Enable ‘sudo’ for the user.
        shell = pkgs.zsh;
	};
}

