#!/bin/bash

REPO_PATH="${PROJECT_HOME}/comwork-cloud-wiki/"

cd "${REPO_PATH}" 
git add .
git stash
git stash clear
git pull origin main || :
git push github main -f
git push pgitlab main -f
exit 0
