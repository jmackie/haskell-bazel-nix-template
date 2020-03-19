{ pkgs ? import ./nix/nixpkgs { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.bazel
    # Development helpers
    pkgs.ghcid
    pkgs.python38
    # Formatters 
    pkgs.nixfmt
    pkgs.haskellPackages.ormolu
  ];
}

