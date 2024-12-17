#!/bin/sh
set -e

if [ "$1" = "nginx" ]; then
    defined_envs=$(printf '${%s} ' $(env | cut -d= -f1))
    front_app_path="/usr/share/nginx/html"
    for file in $(find "${front_app_path}" -type f -name 'config*.js' -o -name 'env*.js' -o -name 'index.html')
    do
        envsubst "$defined_envs" < $file > ${file}.tmp
        mv ${file}.tmp $file
    done
fi

exec "$@"
