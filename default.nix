{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage ./misc/nix/git-cgi-server-molasses.nix { }
