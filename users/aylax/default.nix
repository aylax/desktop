{ ... }:
{
  home-manager.users.aylax = { suites, ... }: {
    imports = suites.base;
  };

  users.users.aylax = {
    uid = 1000;
    password = "linux";
    description = "aylax home";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
