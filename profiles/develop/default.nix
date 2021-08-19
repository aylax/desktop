{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # program languages
    nodejs
    rustup
    ghc
    haskellPackages.stack

    # debugger
    gdb

  ];
}
