#!/usr/bin/env bash

if [ "$(whoami)" != "root" ]; then
    echo "Must be root"
    exit 1
fi

now="$(date +%Y%m%d-%H%M%S)"

mv -v /var/log/nginx/access.log{,."${now}"}
touch /var/log/nginx/access.log
chown -v root:root /var/log/nginx/access.log

systemctl daemon-reload
systemctl reload nginx.service
systemctl restart isubata.golang.service
systemctl status -l isubata.golang.service

# EOF
