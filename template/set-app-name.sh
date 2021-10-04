#/usr/bin/env bash
args=("$@")
set -eux pipefail

template_name="appname"
new_app_name=${args[0]}

Template_name_cap=${template_name^}
New_app_name_cap=${new_app_name^}

find . -type f -not -path '*/\.*' \
  -exec sed -i "s/{${Template_name_cap}}/${New_app_name_cap}/g" {} +

find . -type f -not -path '*/\.*' \
  -exec sed -i "s/{${template_name}}/${new_app_name}/g" {} +

find . -not -path '*/\.*' \
  -name '*'"${Template_name_cap}"'*' \
  -exec rename "${Template_name_cap}" "${New_app_name_cap}" {} +

mv -v appname.cabal "${new_app_name}.cabal"

git add .
git commit -m "Updated appname to ${new_app_name}"
