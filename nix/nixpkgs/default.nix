# Defaults come from 2020-03-18T15:16:25-07:00
{ rev ? "166c9ef85eed0e6edb1cc5ea798e02b8eff12b56"
, sha256 ? "0k2145qz8wcyvwg32k01xlz1ah43ciyqfks65q5hjlfklgn5afag", ... }@args:
import (builtins.fetchTarball {
  name = "nixpkgs-${rev}";
  url = "https://github.com/nixos/nixpkgs/archive/${rev}.tar.gz";
  inherit sha256;
}) (removeAttrs args [ "rev" "sha" ])
