#!/bin/bash

set -e

ME="$0"

get_dir_hash (){
    find /etc/nginx -type f -print0 | sort -z | xargs -0 sha1sum | sha1sum
}

restart (){
    echo "$ME: Checking configuration..." >> /var/log/nginx/error.log
    if nginx -t; then
        echo "$ME: Restarting NGINX..." >> /var/log/nginx/error.log
        nginx -s reload
        CONFIG_HASH=$(get_dir_hash)
        return
    fi
    echo "$ME: Bad config." >> /var/log/nginx/error.log
}

watch_changes (){
    while sleep 3; do
        # Check if config directory hash has changed and reload nginx if it has
        [ "$CONFIG_HASH" != "$(get_dir_hash)" ] && restart
    done
}


CONFIG_HASH=$(get_dir_hash)
watch_changes &
/docker-entrypoint.sh "$@"
