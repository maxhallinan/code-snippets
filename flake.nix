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
      packages.default = pkgs.writeTextFile {
        executable = false;
        name = "hello.sh";
        text = ''
          #!${pkgs.bash}/bin/bash
          echo "Hello, world!
        '';

      };
    }
  );
}
