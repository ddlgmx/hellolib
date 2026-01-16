{
  description = "A shared hello world library";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # Use your Mac system
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # This is the ONLY thing a library flake needs to output
      packages.${system}.default = pkgs.callPackage ./hellolib.nix { };
    };
}
