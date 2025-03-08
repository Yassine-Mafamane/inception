#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing database..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

/usr/bin/mariadbd-safe --datadir='/var/lib/mysql' &

while ! mariadb-admin ping --silent; do
    sleep 1
done

mariadb -u root <<EOF
CREATE DATABASE IF NOT EXISTS WordPress;

CREATE USER IF NOT EXISTS 'molwpdb'@'%' IDENTIFIED BY '${MOL_WP_DB_PASSWORD}';
GRANT ALL PRIVILEGES ON WordPress.* TO 'molwpdb'@'%';

CREATE USER IF NOT EXISTS 'reader'@'%' IDENTIFIED BY '${WP_READER_PASSWORD}';
GRANT SELECT ON WordPress.* TO 'reader'@'%';

DELETE FROM mysql.user WHERE user = '';

ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';

FLUSH PRIVILEGES;
EOF

wait