#/usr/bin/env bash
args=("$@")
set -eux pipefail

template_repo=${args[0]}
new_app_name=${args[1]}

(

git clone \
  --single-branch \
  -b template \
  ${template_repo} ${new_app_name}

cd ${new_app_name}

# git branch

git checkout template
# git branch -d -r origin/master
git remote rename origin template

git checkout -b master

echo ""
echo "App directory:"
pwd
echo ""

./template/init-app.sh "${new_app_name}"

)
