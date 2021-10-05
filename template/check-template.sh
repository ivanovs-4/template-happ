#/usr/bin/env bash
args=("$@")
set -eu pipefail

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
new_app_name=checkapp
check_dir=$(mktemp -d)

(

set -e

cd ${check_dir}

cat ${SCRIPTPATH}/use-template.sh | bash -s -- \
  $(dirname ${SCRIPTPATH}) \
  "${new_app_name}"

cd "${new_app_name}"

echo ""
(
set -x
nix build
)

echo ""
(
set -x
./result/bin/"${new_app_name}"
)

echo ""
(
set -x
nix develop -c cabal build
)

echo ""
(
set -x
nix develop -c cabal test
)

echo ""
(
set -x
nix develop -c cabal exec ${new_app_name}
)

)

echo ""
(
set -x
rm -rf ${check_dir}
)
