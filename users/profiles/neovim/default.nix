{ pkgs, ... }: {
  programs.neovim = {
    enable = false;
    withPython3 = true;
    package = pkgs.neovim-nightly;
    extraPython3Packages = (ps: with ps; [ pynvim unidecode black isort ]);
  };
  home.file = {
    ".config/nvim" = {
      source = ./assets;
      recursive = true;
    };
  };
}
