FROM uselagoon/php-8.1-cli-drupal:latest

COPY composer.json /app/
COPY composer.lock /app/
RUN composer install --prefer-dist --no-dev
COPY . /app
RUN mkdir -p -v -m775 /app/web/sites/default/files

# Define where the Drupal Root is located
ENV WEBROOT=web
