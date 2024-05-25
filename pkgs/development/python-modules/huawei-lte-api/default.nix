{
  lib,
  buildPythonPackage,
  pythonOlder,
  fetchFromGitHub,
  pycryptodomex,
  pytestCheckHook,
  requests,
  xmltodict,
}:

buildPythonPackage rec {
  pname = "huawei-lte-api";
  version = "1.8.1";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "Salamek";
    repo = "huawei-lte-api";
    rev = "refs/tags/${version}";
    hash = "sha256-KmkoCQDZ1NC3CKfV5DZBukExF9fUTojvWv2ZLTCzRZU=";
  };

  propagatedBuildInputs = [
    pycryptodomex
    requests
    xmltodict
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [
    "huawei_lte_api.AuthorizedConnection"
    "huawei_lte_api.Client"
    "huawei_lte_api.Connection"
  ];

  meta = with lib; {
    description = "API For huawei LAN/WAN LTE Modems";
    homepage = "https://github.com/Salamek/huawei-lte-api";
    changelog = "https://github.com/Salamek/huawei-lte-api/releases/tag/${version}";
    license = licenses.lgpl3Only;
    maintainers = with maintainers; [ dotlambda ];
  };
}
