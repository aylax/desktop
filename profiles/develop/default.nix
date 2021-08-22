{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # program languages
    nodejs
    rustup
    ghc
    haskellPackages.stack
    gnuapl

    # debugger
    gdb

    # x-agent gui
    qv2ray

  ];
}
