FROM mcr.microsoft.com/devcontainers/php:1-8.2-bullseye

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libyaml-dev \
    zip \
    && docker-php-ext-install zip

# Install YAML extension
RUN pecl install yaml && docker-php-ext-enable yaml

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /workspace
