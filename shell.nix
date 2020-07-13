let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { overlays = [ (import ./nix/overlays.nix) ]; };
in pkgs.mkShell {
  buildInputs = [
    pkgs.docsonnet
    pkgs.jsonnet
    pkgs.jsonnet-bundler
    pkgs.jsonnet-tests
    pkgs.niv
  ];
}
