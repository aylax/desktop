{ lib, pkgs, ... }:
let
  inherit (builtins) toFile readFile;
  inherit (lib) fileContents mkForce;
in
{
  home-manager.users.aylax = { suites, ... }: {
    imports = suites.base ++ [
      ../profiles/git
      ../profiles/emacs
      ../profiles/neovim
      ../profiles/direnv
      ../profiles/alacritty
      ../profiles/syncthing
    ];
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
