{ stdenv, cmake }:

stdenv.mkDerivation {
  pname = "hellolib";
  version = "1.0.0";

  # This tells Nix to look specifically in the hellolib folder
  src = ./.;

  nativeBuildInputs = [ cmake ];
}