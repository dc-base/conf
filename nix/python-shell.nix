let
  pkgs = import <nixpkgs> {};
  python-env = pkgs.python3.withPackages (pp: with pp; [ pip wheel cython ]);
in
pkgs.mkShell {
  buildInputs = [
    python-env
  ];
  NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc
    pkgs.stdenv.cc.cc.lib
    pkgs.openssl
    pkgs.zlib
  # ...
  ];
  NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
  LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib/";
  shellHook = ''
    LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib/
    [[ -d .venv ]] || python -m venv .venv
    source .venv/bin/activate
  '';
}
