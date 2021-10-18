{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    withPython3 = true;
    extraPython3Packages = (ps: with ps; [ pynvim unidecode black isort ]);
  };
  home.file = {
    ".config/nvim" = {
      source = ./assets;
      recursive = true;
    };
  };
}
