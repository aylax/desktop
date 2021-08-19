{ lib, pkgs, config, ... }:

{

  imports = [ ./bluetooth ];
  networking.wireless.enable = true;

}
