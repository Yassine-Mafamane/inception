#! /bin/sh

mkdir -p /var/www/html/

addgroup -g 82 -S www-data
adduser -u 82 -D -S -G www-data www-data

curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz
tar -xzf wordpress.tar.gz -C /var/www/html

rm wordpress.tar.gz

chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i "s/database_name_here/WordPress/" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/molwpdb/" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/$MOL_WP_DB_PASSWORD/" /var/www/html/wordpress/wp-config.php
sed -i "s/localhost/mariadb:3306/" /var/www/html/wordpress/wp-config.php

exec php-fpm83 -F