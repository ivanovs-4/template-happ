#/usr/bin/env bash
set -eu pipefail

current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

if [ "$current_branch" = "template" ]; then
  echo ""
  echo "CHECKING TEMPLATE BEFORE PUSH ..."
  ./template/check-template.sh
fi
