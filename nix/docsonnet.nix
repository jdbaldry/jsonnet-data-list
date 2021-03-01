{ stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "docsonnet";
  version = "3e17576"; # Aug 17, 2020

  src = fetchFromGitHub {
    owner = "sh0rez";
    repo = pname;
    rev = version;
    sha256 = "sha256-1tOPmCtQ/7S+nYByxHdVRmGSFBoHVjWSVvX+CAycWp8=";
  };

  modSha256 = "0s2zjnglsfkmmqnvymgc59glypkclx029j8gqmfapczkwsgzl3x9";

  meta = with stdenv.lib; {
    description = "Experimental Jsonnet docs generator";
    license = licenses.unlicense;
  };
}
