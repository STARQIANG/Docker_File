#!/bin/bash
set -e
if [ -z "PROXY_HOSTS" ]; then
    rm -rf /etc/nginx/conf.d/default.conf
    host_temp=
    OLD_IFS="$IFS"
    IFS=","
    arr=(${PROXY_HOSTS})
    IFS="$OLD_IFS"
    for s in ${arr[@]}
    do

        host_temp=${host_temp}"server "${s}
    done
    echo "==================${PROXY_HOSTS}================"
    echo "==================${host_temp}=================="
    sed -i  's/PROXY_HOSTS/'"${host_temp}"'/' /etc/nginx/conf.d/custom.conf

else
    rm -rf /etc/nginx/conf.d/custom.conf
fi

mkdir -p  /var/cache/nginx/client_temp

exec "$@"
