FROM php:8.3-apache

# Extensões necessárias pro Laravel
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd


# Habilitar mod_rewrite pro Laravel
RUN a2enmod rewrite

# Ajustar DocumentRoot pra /public
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf /etc/apache2/apache2.conf

WORKDIR /var/www/html

# Copia o código (só pro build inicial; em runtime vamos montar volume)
COPY . /var/www/html
