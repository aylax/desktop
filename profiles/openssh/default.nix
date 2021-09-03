{ lib, ... }:

{
  services.openssh = {
    enable = true;
    openFirewall = lib.makeDefault false;
    challengeResponseAuthentication = false;
    passwordAuthentication = false;
    forwardX11 = true;
    permitRootLogin = "no";
    startWhenNeeded = true;
  };
}
