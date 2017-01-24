FROM webdevops/php-nginx:debian-9
RUN apt-get -y update && apt-get install -y aptitude

COPY conf/ /opt/docker/

RUN /usr/local/bin/apt-install \
        php7.0-xdebug \
        acl \
        openjdk-8-jre \
        nodejs \
        node-less

RUN echo "error_reporting = E_ALL" >> /etc/php/7.0/mods-available/xdebug.ini
RUN echo "display_startup_errors = On" >> /etc/php/7.0/mods-available/xdebug.ini
RUN echo "display_errors = On" >> /etc/php/7.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_autostart=1" >> /etc/php/7.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_enable=1" >> /etc/php/7.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /etc/php/7.0/mods-available/xdebug.ini
RUN echo "xdebug.idekey=\"PHPSTORM\"" >> /etc/php/7.0/mods-available/xdebug.ini
RUN echo "xdebug.remote_port=9001" >> /etc/php/7.0/mods-available/xdebug.ini

RUN /usr/sbin/phpenmod xdebug