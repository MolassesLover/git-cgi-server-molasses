{ lib, buildGoModule }:

with lib;

buildGoModule rec {
  pname = "git-cgi-server-molasses";
  version = "v0.0.1";

  src = ../.;

  vendorHash = "sha256-f+cU54rRum4ZSUcPrGyHYDlRaT5vf0HTa3GUQ5w5KCY=";
}
