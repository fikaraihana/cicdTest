# Menggunakan gambar PHP 7.4 Apache
FROM php:7.4-apache

# Menyalin kode proyek CodeIgniter ke dalam container
COPY . /var/www/html

# Menginstal modul yang diperlukan
RUN apt-get update && \
    apt-get install -y libzip-dev && \
    docker-php-ext-install zip pdo_mysql mysqli && \
    a2enmod rewrite

# Mengatur konfigurasi server Apache
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Menjalankan server Apache
CMD ["apache2-foreground"]
