# Use PHP 8.2 as the base image
FROM php:8.2

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libicu-dev \
    libzip-dev \
    libyaml-dev

# Install PHP extensions
RUN docker-php-ext-install intl zip
RUN pecl install yaml && docker-php-ext-enable yaml

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install PHPUnit
RUN composer global require phpunit/phpunit:^9.5.21 --prefer-dist

# Set the working directory
WORKDIR /app

# Add Composer's global binaries to the PATH
ENV PATH="/root/.composer/vendor/bin:${PATH}"
