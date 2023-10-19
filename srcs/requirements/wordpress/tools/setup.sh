#!/bin/sh
if [ $(ls /var/www/html | grep "wordpress" | wc -l)  -eq 0 ];
then
sleep 30
cd /var/www/html/ && wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz &&  rm latest.tar.gz

cp /tmp/wp-config.php /var/www/html/wordpress

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR \
        --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL \
        --allow-root --skip-email --path=/var/www/html/wordpress

#create a new user
wp user create $WP_USR_LOGIN $WP_USR_EMAIL --role=author --user_pass=$WP_USR_PASS --allow-root --path=/var/www/html/wordpress
fi

exec "$@"