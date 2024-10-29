{
  description = "maxhallinan/code-snippets";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
  let
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in
  flake-utils.lib.eachDefaultSystem (
    system:
    let
      pkgs = nixpkgs.legacyPackages.${system};

      packageName = "shell-scripts";
    in
    {
      packages.default = pkgs.runCommand "code-snippets" { } ''
        mkdir -p $out
        cp -r ${./code-snippets}/* $out
      '';
    }
  );
}
