{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "jsonnet-tests";
  version = "0.16.0";

  src = fetchFromGitHub {
    owner = "google";
    repo = "jsonnet";
    rev = "v${version}";
    sha256 = "0wxhc0ghjk88zrrn9a18h979ipkia2rx12489515gzhlplfx6724";
  };

  phases = "unpackPhase installPhase fixupPhase";
  installPhase = ''
    mkdir -p $out/bin
    cp ${src}/test_suite/tests.source  $out/bin/
    cp ${src}/test_suite/refresh_golden.sh $out/bin/
    cp ${src}/test_suite/run_tests.sh $out/bin/
    chmod +x $out/bin/refresh_golden.sh
    chmod +x $out/bin/run_tests.sh
    sed -i -E 's/^cd "\$\(dirname \$0\)"$/cd "$1"/' $out/bin/run_tests.sh
    sed -i -E 's/^source ("tests\.source")/source \$(dirname \$0)\/\1/' $out/bin/run_tests.sh
'';

  meta = with stdenv.lib; {
    license = licenses.asl20;
  };
}
