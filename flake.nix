{
  description = "HyTech Lab 2 - Part 1";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    let
      # This overlay connects your default.nix to the Nix package set
      hello_world_overlay = final: prev: {
        hellolib = final.callPackage ./hellolib.nix { };
        helloapp = final.callPackage ./default.nix { };
      };

      my_overlays = [ hello_world_overlay ];

      # This is specifically for your MacBook Pro
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        overlays = [ self.overlays.default ];
      };
    in
    {
      overlays.default = nixpkgs.lib.composeManyExtensions my_overlays;

      packages.aarch64-darwin = {
        default = pkgs.helloapp;
      };

      devShells.aarch64-darwin.default = pkgs.mkShell {
        name = "nix-devshell";
        packages = with pkgs; [
          cmake
          hellolib
          helloapp
        ];
      };
    };
}