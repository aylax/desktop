{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # *telegram-desktop*
    # execute command below if use xdg-open to open tg://xxx
    # xdg-mime default kotatogram.desktop x-scheme-handler/tg
    # xdg-mine default kotatogram.desktop application/x-xdg-protocol-tg
    kotatogram-desktop
    # You-Get is a tiny command-line utility to download media contents (videos, audios, images)
    you-get
  ];
}
