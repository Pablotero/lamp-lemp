FROM php:8.2-fpm

# Instalar dependencias del sistema necesarias para compilar extensiones PHP
RUN apt update && apt install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libonig-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        pdo_mysql \
        gd \
        zip \
        xml \
        curl \
        mbstring \
        intl

CMD ["php-fpm"]
