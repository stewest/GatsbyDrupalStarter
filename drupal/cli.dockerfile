FROM amazeeio/php:7.4-cli-drupal

COPY composer.json /app/
# Uncomment if you have a scripts directory in your Drupal Installation
# COPY scripts /app/scripts
# Uncomment if you have a patches directory in your Drupal Installation
# COPY patches /app/patches
RUN composer selfupdate --2 && \
    composer global remove hirak/prestissimo

RUN composer install --prefer-dist --no-dev
COPY . /app

# Define where the Drupal Root is located
ENV WEBROOT=web
