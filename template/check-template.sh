#/usr/bin/env bash
args=("$@")
set -eu pipefail

new_app_name=checkapp
check_dir=$(mktemp -d)

(

set -e

cd ${check_dir}

git clone /home/iv/haskell/templates/template-happ/ ${new_app_name}
cd ${new_app_name}

echo ""
echo "App directory:"
pwd
echo ""

./template/set-app-name.sh "${new_app_name}"

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
