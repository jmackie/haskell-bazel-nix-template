# Give your project a name. :)
workspace(name = "WHAT_YOU_GONNA_CALL_IT")

# Load the repository rule to download an http archive.
load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)

# (I needed to add this)
http_archive(
    name = "rules_proto",
    sha256 = "57001a3b33ec690a175cdf0698243431ef27233017b9bed23f96d44b9c98242f",
    strip_prefix = "rules_proto-9cd4f8f1ede19d81c6d48910429fe96776e567b1",
    urls = [
        "https://github.com/bazelbuild/rules_proto/archive/9cd4f8f1ede19d81c6d48910429fe96776e567b1.tar.gz",
    ],
)

# Download rules_haskell and make it accessible as "@rules_haskell".
http_archive(
    name = "rules_haskell",
    strip_prefix = "rules_haskell-0.12",
    urls = ["https://github.com/tweag/rules_haskell/archive/v0.12.tar.gz"],
    sha256 = "56a8e6337df8802f1e0e7d2b3d12d12d5d96c929c8daecccc5738a0f41d9c1e4",
)

load(
    "@rules_haskell//haskell:repositories.bzl",
    "rules_haskell_dependencies",
)

# Setup all Bazel dependencies required by rules_haskell.
rules_haskell_dependencies()

# Load rules_nixpkgs things,
# which was already initialized by rules_haskell_dependencies above.
load(
    "@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl",
    "nixpkgs_local_repository",
    "nixpkgs_python_configure",
)

nixpkgs_python_configure(
    repository = "@nixpkgs",
)

# Use the local nixpkgs pin.
nixpkgs_local_repository(
    name = "nixpkgs",
    nix_file = "//nix/nixpkgs:default.nix",
)

load(
    "@rules_haskell//haskell:nixpkgs.bzl",
    "haskell_register_ghc_nixpkgs",
)

# Fetch a GHC binary distribution from nixpkgs and register it as a toolchain.
# For more information:
# https://api.haskell.build/haskell/nixpkgs.html#haskell_register_ghc_nixpkgs
haskell_register_ghc_nixpkgs(
    repository = "@nixpkgs",
    attribute_path = "ghc",
    version = "8.8.3",
)

load(
    "@rules_haskell//haskell:cabal.bzl",
    "stack_snapshot",
)

# zlib is needed by most interesting Haskell packages.
# Adapted from the rules_haskell examples
# See https://github.com/tweag/rules_haskell/blob/master/examples/WORKSPACE
http_archive(
    name = "zlib-hs",
    build_file = "//bazel:zlib-hs.bzl",
    sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
    strip_prefix = "zlib-1.2.11",
    urls = [
        "https://mirror.bazel.build/zlib.net/zlib-1.2.11.tar.gz",
        "http://zlib.net/zlib-1.2.11.tar.gz",
    ],
)

stack_snapshot(
    name = "stackage",
    snapshot = "lts-15.4",  # should match the ghc (toolchain) version
    packages = [
        "warp",
        "wai",
        "http-types",
    ],
    extra_deps = {"zlib": ["@zlib-hs"]},
)
