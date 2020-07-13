{ stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "docsonnet";
  version = "master";

  src = fetchFromGitHub {
    owner = "sh0rez";
    repo = pname;
    rev = version;
    sha256 = "1qx8hqm720l1yc8fw5npvi74vmg6r3rh2qij61xcnk6h9r20mwl8";
  };

  modSha256 = "0s2zjnglsfkmmqnvymgc59glypkclx029j8gqmfapczkwsgzl3x9";

  meta = with stdenv.lib; {
    description = "Experimental Jsonnet docs generator";
    license = licenses.unlicense;
  };
}
