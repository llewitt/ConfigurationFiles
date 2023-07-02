{ config, pkgs, ... }:
{
  imports = [
    ./lucy.nix
  ];

  nixpkgs = {
      config.allowUnfree = true;
      overlays = [(self: super: {discord = super.discord.overrideAttrs (_: {src = builtins.fetchTarball https://discord.com/api/download?platform=linux&format=tar.gz;});})];
  };

  virtualisation.virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
  };

  users.extraGroups.vboxusers.members = [ "lucy" ];

  environment.systemPackages = [ pkgs.discord ];
}

