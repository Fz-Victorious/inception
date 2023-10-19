# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fabou-za <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/19 20:19:52 by fabou-za          #+#    #+#              #
#    Updated: 2023/07/19 20:19:55 by fabou-za         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=srcs/docker-compose.yml
VOLUME=`docker volume ls -q`
SERVICES=nginx wordpress mariadb
DIR1 := /home/fabou-za/data/wp
DIR2 := /home/fabou-za/data/db

build:
	@if [ ! -d $(DIR1) ]; then \
		mkdir -p $(DIR1); \
	fi
	@if [ ! -d $(DIR2) ]; then \
		mkdir -p $(DIR2); \
	fi
	docker-compose -f ${NAME} up --build

clean:
	docker-compose -f ${NAME} down

rmim:
	docker rmi ${SERVICES}
rmvol:
	docker volume rm ${VOLUME}

fclean: clean rmim rmvol
re: fclean build 
