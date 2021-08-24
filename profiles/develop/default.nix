{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # compiler
    gcc

    # program languages
    ghc
    nodejs
    rustup
    haskellPackages.stack

    # debugger
    gdb

    # x-agent gui
    qv2ray

  ];
}
