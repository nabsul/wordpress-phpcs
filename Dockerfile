FROM ubuntu:bionic
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl php-cli php-mbstring php-curl php-xml git unzip
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php
RUN php composer.phar global require "squizlabs/php_codesniffer=*"
RUN git clone -b master https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git /root/.composer/vendor/bin/wpcs
ENV PATH="/root/.composer/vendor/bin:${PATH}"
RUN phpcs --config-set installed_paths /root/.composer/vendor/bin/wpcs
RUN phpcs --config-set default_standard WordPress
