{ pkgs, ... }: {
  xsession.windowManger.xmonad = {
    enable = false;
    enableContribAndExtras = true;
  };

  home.file = {
    ".config/xmonad" = {
      source = ./assets;
      recursive = true;
    };
  };
}
