{ self, config, lib, pkgs, ... }:
let inherit (lib) fileContents;
in
{
  imports = [ ../cachix ];

  nix.systemFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];

  environment = {

    systemPackages = with pkgs; [
      # devos added
      binutils
      coreutils
      direnv
      dnsutils
      dosfstools
      gptfdisk
      iputils
      manix
      moreutils
      nix-index
      nmap
      skim
      tealdeer
      usbutils
      utillinux
      whois

      # standard comands
      jq # :for fomat json
      fd # :power [ find ]
      git # :for version control
      curl # :for network
      gotop # :replace [ top ]
      #  neovim # :replace [ vim ]
      pandoc # :for transfer file
      wget # :for network
      tokei # :replace [ loc ]
      fzf # :for luzzy search
      exa # :replace [ ls tree ]
      zoxide # :for quick cd
      ripgrep # :replace [ grep ]
    ];

    shellAliases =
      let ifSudo = lib.mkIf config.security.sudo.enable;
      in
      {
        # quick cd
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";

        # git
        g = "git";

        # grep
        grep = "rg";
        gi = "grep -i";

        # ls
        ls = "exa";
        tree = "exa -T";

        # top
        top = "gotop";

        # loc
        loc = "tokei";

        # internet ip
        myip = "dig +short myip.opendns.com @208.67.222.222 2>&1";

        # fix nixos-option
        nixos-option = "nixos-option -I nixpkgs=${self}/lib/compat";

      };
  };

  fonts = {
    fonts = with pkgs; [ powerline-fonts dejavu_fonts ];

    fontconfig.defaultFonts = {

      monospace = [ "DejaVu Sans Mono for Powerline" ];

      sansSerif = [ "DejaVu Sans" ];

    };
  };

  nix = {

    autoOptimiseStore = true;

    gc.automatic = true;

    optimise.automatic = true;

    useSandbox = true;

    allowedUsers = [ "@wheel" ];

    trustedUsers = [ "root" "@wheel" ];

    extraOptions = ''
      min-free = 536870912
      keep-outputs = true
      keep-derivations = true
      fallback = true
    '';

  };

  # powerful shell
  programs.xonsh.enable = true;

  programs.bash = {
    promptInit = ''
      eval "$(${pkgs.starship}/bin/starship init bash)"
    '';
    interactiveShellInit = ''
      eval "$(${pkgs.direnv}/bin/direnv hook bash)"
      export PATH = "$HOME/.local/bin:$PATH"
    '';
  };

  services.earlyoom.enable = true;

}
