# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fabou-za <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/19 20:05:02 by fabou-za          #+#    #+#              #
#    Updated: 2023/07/19 20:05:05 by fabou-za         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
Run apt-get update && apt-get install -y wget php \
			php-zip \
			php-cli \
			php-mbstring \
			php-xml \
			php-gd \
			php-curl \
			php-mysql \
			php-fpm
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir /run/php
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/setup.sh /tmp
COPY ./conf/wp-config.php /tmp
Expose 9000

ENTRYPOINT [ "sh", "/tmp/setup.sh" ]

CMD [ "php-fpm7.3", "-F" ]
