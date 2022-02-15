# Установка репозитория EPEL
yum install epel-release

# Установка Nginx
yum install nginx

# Установка Apache
yum install httpd

# Запуск Nginx
systemctl start nginx

# Автозапуск Nginx
systemctl enable nginx

# Проверка статуса
systemctl status nginx

# Запуск Apache
systemctl start httpd

# Автозапуск Apache
systemctl enable httpd


# Проверка статуса
systemctl status httpd

# Отключаем SELinux
setenforce 0

# Отключаем firewalld
systemctl stop firewalld
systemctl disable firewalld

# Проверка портов
ss -ntlp

# проверка загрузки url
curl localhost:8081 | grep 8081

# Apache config httpd.conf

Listen 8080;

# Apache default page
/etc/httpd/conf.d/welcome.conf

# Aapche default DocumentRoot

/var/www/html

# Nginx conf
Убираем блок server { }







