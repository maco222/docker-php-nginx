FROM webdevops/php-nginx:debian-9
RUN apt-get -y update && apt-get install -y aptitude

COPY conf/ /opt/docker/

RUN /usr/local/bin/apt-install \
        php7.0-xdebug