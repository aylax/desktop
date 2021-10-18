{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.file = {
    ".config/emacs" = {
      source = ./assets;
      recursive = true;
    };
  };
}
