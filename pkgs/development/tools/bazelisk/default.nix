{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "bazelisk";
  version = "1.14.0";

  src = fetchFromGitHub {
    owner = "bazelbuild";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-y3DVU2xHYZGUqf+kXhBDpTHACloqOXiMFY9bWU/QfOg=";
  };

  vendorSha256 = "sha256-JJdFecRjPVmpYjDmz+ZBDmyT3Vj41An3BXvI2JzisIg=";

  doCheck = false;

  ldflags = [ "-s" "-w" "-X main.BazeliskVersion=${version}" ];

  meta = with lib; {
    description = "A user-friendly launcher for Bazel";
    longDescription = ''
      BEWARE: This package does not work on NixOS.
    '';
    homepage = "https://github.com/bazelbuild/bazelisk";
    license = licenses.asl20;
    maintainers = with maintainers; [ elasticdog ];
  };
}
