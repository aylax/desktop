{ lib, pkgs, ... }:
let
  inherit (builtins) toFile readFile;
  inherit (lib) fileContents mkForce;
in
{
  home-manager.users.aylax = { suites, ... }: {
    imports = suites.base;
  };

  users.users.aylax = {
    uid = 1000;
    password = "linux";
    description = "AyLax";
    isNormalUser = true;
    extraGroups = [ 
      "wheel"
      "docker"
    ];
  };
}
