{ pkgs ? import ./nix/nixpkgs { } }:
#                ^^^^^^^^^
# NOTE: bazel will use this same nixpkgs pin

pkgs.mkShell {
  buildInputs = [
    pkgs.bazel

    # Useful stuff for development
    pkgs.ghcid

    # (formatters)
    pkgs.nixfmt
    pkgs.haskellPackages.ormolu
  ];
}

