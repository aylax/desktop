{ config, lib, pkgs, suites, ... }:

{
  imports = suites.workstation;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "uas" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/b33094cb-371f-7846-af2a-30b8ab11c066";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/89EF-AB1E";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/f1d6d611-6279-44c1-9002-9e730e514d55"; }
    ];


  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

}
