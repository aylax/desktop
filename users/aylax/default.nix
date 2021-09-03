{ lib, pkgs, ... }:
let
  inherit (builtins) toFile readFile;
  inherit (lib) fileContents mkForce;
in
{
  home-manager.users.aylax = { suites, ... }: {
    imports = suites.base ++ [
      ../profiles/emacs
      ../profiles/neovim
      ../profiles/social
      ../profiles/alacritty
      ../profiles/syncthing
    ];

    home.file.".gitconfig".source = ./assets/git-config;
    home.file.".git-commit-style".source = ./assets/git-commit-style;

  };

  users.users.aylax = {
    uid = 1000;
    password = "linux";
    description = "aylax";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ];
  };
}
