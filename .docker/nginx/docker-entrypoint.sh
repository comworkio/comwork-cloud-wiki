#!/bin/sh
set -e

if [ "$1" = "nginx" ]; then
    defined_envs=$(printf '${%s} ' $(env | cut -d= -f1))
    front_app_path="/usr/share/nginx/html"
    for file in $(find "${front_app_path}" -type f -name '*.css' -o -name '*.js' -o -name '*.html')
    do
        envsubst "$defined_envs" < $file > ${file}.tmp
        mv ${file}.tmp $file
    done

    # To prevent cache issues
    sed -i 's!\(vendor\|app\)\.\([^\.]\+\)\.\(js\|css\)"!\1.\2.\3?t='$(date '+%s')'"!g' "${front_app_path}/index.html"
fi

exec "$@"