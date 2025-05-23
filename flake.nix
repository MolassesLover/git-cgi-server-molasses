{
  description = "Molasses' fork of pasela's git-cgi-server project, written in Go.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = (import nixpkgs { inherit system; });
          git-cgi-server-molasses = pkgs.callPackage ./misc/nix/git-cgi-server-molasses.nix { };
        in
        {
          inherit git-cgi-server-molasses;
          default = git-cgi-server-molasses;
          devShell = pkgs.mkShell { inputsFrom = [ git-cgi-server-molasses ]; };
        }
      );
    };
}
