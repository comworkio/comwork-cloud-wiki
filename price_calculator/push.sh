#!/usr/bin/env bash

cd "${HOME_PROJECT}/comwork_cloud"

git checkout $CI_COMMIT_REF_NAME
git pull origin $CI_COMMIT_REF_NAME
./price_calculator/price_calculator.sh
git add .
git commit -m "Update pricing and push"
git push origin $CI_COMMIT_REF_NAME
