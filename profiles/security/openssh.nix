{ lib, ... }:

{
  services.openssh = {
    enable = true;
    challengeResponseAuthentication = false;
    passwordAuthentication = false;
    forwardX11 = true;
    permitRootLogin = "no";
    startWhenNeeded = true;
  };
}
