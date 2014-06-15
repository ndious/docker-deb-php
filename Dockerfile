############################################################
# Dockerfile to run php-fpm 5.4 Containers
# Based on Ubuntu Image
############################################################

# Set the base image to use to Ubuntu
FROM debian

# Set the file maintainer (your name - the file's author)
MAINTAINER Maintaner NDufreche

# Update the default application repository sources list
RUN apt-get update

# Install PHP
RUN apt-get install -y php5 php5-mysql php5-curl 

# Install php-fpm
RUN apt-get install -y php5-fpm

# Add www folder
VOLUME /www
ADD www /www
WORKDIR /www

# Port to expose
EXPOSE 9000

# Configure fpm
RUN touch /etc/php5/fpm/pool.d/www.conf
RUN echo "listen = 0.0.0.0:9000'\nlisten.owner = www-data\nlisten.group = www-data\nlisten.mode = 0660" > /etc/php5/fpm/pool.d/www.conf

ENTRYPOINT ["/www/public/index.php"]
