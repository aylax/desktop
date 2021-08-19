{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {

      window = {
        padding = {
          x = 25;
          y = 25;
          dynamic_padding = true;
          decoration = "none";
        };
      };

      font = {
        size = 12.0;
      };

      colors = {
        primary = {
          background = "0xfffaf3";
          foreground = "0x575279";
        };
        cursor = {
          text = "0x111111";
          cursor = "0xff2800";
        };
        vi_mode_cursor = {
          text = "0x111111";
          cursor = "0xff2800";
        };
        line_indicator = {
          foreground = "None";
          background = "None";
        };
        selection = {
          text = "CellForeground";
          background = "0xf5e2df";
        };
        normal = {
          black = "0x6e6a86";
          red = "0xb4637a";
          green = "0x56949f";
          yellow = "0xea9d34";
          blue = "0x286983";
          magenta = "0x907aa9";
          cyan = "0xd7827e";
          white = "0x575279";
        };
        bright = {
          black = "0x6e6a86";
          red = "0xeb6f92";
          green = "0x9ccfd8";
          yellow = "0xf6c177";
          blue = "0x31748f";
          magenta = "0xc4a7e7";
          cyan = "0xebbcba";
          white = "0xe0def4";
        };
      };
      bell = {
        animation = "EaseOutExpo";
        duration = 0;
        color = "#ffffff";
      };
      background_opacity = 1;
      live_config_reload = true;
      selection = {
        save_to_clipboard = true;
      };
      cursor = {
        style.shape = "Block";
        style.blinking = "Always";
        blink_interval = 480;
      };
    };
  };

}
