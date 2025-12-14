FROM php:8.3-apache

# Extensões necessárias pro Laravel
RUN docker-php-ext-install pdo pdo_mysql

# Habilitar mod_rewrite pro Laravel
RUN a2enmod rewrite

# Ajustar DocumentRoot pra /public
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf /etc/apache2/apache2.conf

WORKDIR /var/www/html

# Copia o código (só pro build inicial; em runtime vamos montar volume)
COPY . /var/www/html
