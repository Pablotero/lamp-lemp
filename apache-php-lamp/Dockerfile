# Usamos Debian 12 como base
FROM debian:12

# Actualizamos e instalamos los paquetes necesarios
RUN apt update && apt install -y \
    apache2 \
    php \
    libapache2-mod-php \
    php-mysql \
    php-curl \
    php-xml \
    php-mbstring \
    php-zip \
    php-gd \
    php-intl \
    unzip \
    curl \
    wget \
    git \
    nano

RUN apt update && apt install -y default-mysql-client


# Activamos módulos de Apache necesarios
RUN a2enmod rewrite headers ssl

# Copiar el VirtualHost de Apache al contenedor
COPY vhost-apache.conf /etc/apache2/sites-enabled/000-default.conf

# Configurar permisos en la carpeta de PrestaShop
RUN chown -R www-data:www-data /var/www/html

# Exponer los puertos 80 y 443
EXPOSE 80 443

# Comando para iniciar Apache en primer plano
CMD ["apachectl", "-D", "FOREGROUND"]
