#!/usr/bin/env bash

if [ "$(whoami)" != "root" ]; then
    echo "Must be root"
    exit 1
fi

set -u

# MYSQL_HOST=""
# MYSQL_PORT="3306"
MYSQL_USER="isucon"
MYSQL_PASSWORS="isucon"

now="$(date +%Y%m%d-%H%M%S)"

mv -v /tmp/slow_query.log{,."${now}"}
# mysqladmin -u"${MYSQL_USER}" -p"${MYSQL_PASSWORS}" flush-logs

systemctl daemon-reload
systemctl restart mysql.service
systemctl status mysql.service
mysqladmin -uroot flush-logs

# journalctl -xef -u mysql.service
# EOF
