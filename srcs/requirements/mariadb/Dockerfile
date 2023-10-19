# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fabou-za <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/19 20:00:50 by fabou-za          #+#    #+#              #
#    Updated: 2023/07/19 20:01:30 by fabou-za         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update -y && apt-get install -y mariadb-server sudo

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf 

COPY ./tools/run.sh /run.sh

RUN chmod +x /run.sh

CMD ["/bin/bash", "/run.sh"]

