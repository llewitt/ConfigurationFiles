{ config, pkgs, ... }:
{
  boot = {
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sda"; # or "nodev" for efi only
      enableCryptodisk = true;
      efiSupport = false;
      # efiSupport = true;
      # efiInstallAsRemovable = true;
    };
    
    # efi.efiSysMountPoint = "/boot/efi";
  };

  boot.initrd.luks.devices.luks-root = {
    device = "/dev/disk/by-uuid/8beeb639-ff3e-4d5d-97c9-9349a7f26862";
  	preLVM = true;
  	allowDiscards = true;
  };
}

