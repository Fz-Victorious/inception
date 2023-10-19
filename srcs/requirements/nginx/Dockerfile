# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fabou-za <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/19 20:03:20 by fabou-za          #+#    #+#              #
#    Updated: 2023/07/19 20:03:23 by fabou-za         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use Debian as the base image
FROM debian:buster

# Install Nginx and openssl
RUN apt-get update && apt-get install -y nginx openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/fabou-za.crt \
		-keyout /etc/nginx/ssl/fabou-za.key \
		-subj "/C=FR/ST=Khouribga/L=Khouribga/O=42 School/OU=fabou-za/CN=fabou-za/"

# Copy Nginx configuration file
COPY ./conf/nginx.config /etc/nginx/sites-available/default

#Enable port
EXPOSE 443

#Start Nginx Server
CMD ["nginx", "-g", "daemon off;"]
