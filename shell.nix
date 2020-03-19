{ pkgs ? import ./nix/nixpkgs { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.bazel
    # Development helpers
    pkgs.ghcid
    # Formatters 
    pkgs.nixfmt
    pkgs.haskellPackages.ormolu
  ];
}

