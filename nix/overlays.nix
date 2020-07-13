self: super:
let callPackage = self.callPackage;
in {
  docsonnet = callPackage ./docsonnet.nix { };
  jsonnet-bundler = callPackage ./jsonnet-bundler.nix { };
  jsonnet-tests = callPackage ./jsonnet-tests.nix { };
}
