{ lib, pkgs, config, ... }:

{

  imports = [ ./bluetooth ];

  networking.wireless.enable = true;
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  networking.extraHosts = ''
    185.199.108.133  raw.githubusercontent.com
    185.199.109.133  raw.githubusercontent.com
    185.199.110.133  raw.githubusercontent.com
    185.199.111.133  raw.githubusercontent.com   
  '';

}
