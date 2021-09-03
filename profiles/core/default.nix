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
      unzip # :for zip
      gotop # :replace [ top ]
      pandoc # :for transfer file
      wget # :for network
      tokei # :replace [ loc ]
      fzf # :for luzzy search
      exa # :replace [ ls tree ]
      zoxide # :for quick cd
      ripgrep # :replace [ grep ]
      chromium #:for browser
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

        # nvim
        vim = "nvim";

        # grep
        grep = "rg";

        # ls
        ls = "exa";
        la = "ls -al";
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

  programs.bash = {
    promptInit = ''
      eval "$(${pkgs.starship}/bin/starship init bash)"
    '';
    interactiveShellInit = ''
      eval "$(zoxide init bash)"
      eval "$(${pkgs.direnv}/bin/direnv hook bash)"
      export PATH="$HOME/.local/bin:$PATH"
    '';
  };

  services.earlyoom.enable = true;

}
