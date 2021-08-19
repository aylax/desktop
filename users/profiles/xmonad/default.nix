{ pkgs, ... }: {
  xsession.windowManger.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  home.file = {
    ".config/xmonad" = {
      source = ./assets;
      recursive = true;
    };
  };
}
