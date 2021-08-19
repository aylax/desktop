{ lib, pkgs, config, ... }:

{

  imports = [ ./bluetooth ];

  networking.wireless.enable = true;
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

}
