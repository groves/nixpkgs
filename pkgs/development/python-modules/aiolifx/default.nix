{ lib
, fetchPypi
, buildPythonPackage
, pythonOlder
, ifaddr
, bitstring
}:

buildPythonPackage rec {
  pname = "aiolifx";
  version = "0.8.5";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+mp6MycCDInFOZTVwpOhJiLkl/qKYjPhoch6LwO5aL4=";
  };

  propagatedBuildInputs = [
    bitstring
    ifaddr
  ];

  # tests are not implemented
  doCheck = false;

  pythonImportsCheck = [
    "aiolifx"
  ];

  meta = with lib; {
    description = "Module for local communication with LIFX devices over a LAN";
    homepage = "https://github.com/frawau/aiolifx";
    license = licenses.mit;
    maintainers = with maintainers; [ netixx ];
  };
}
