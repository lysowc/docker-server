#zts版本
FROM php:7.4.3-fpm

LABEL maintainer="lysowc <lysowc@gmail.com>" version="0.01" license="MIT" describe="local-server"

#替换apt源
RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
sed -i 's/security-cdn.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list

#安装一些依赖库
RUN apt-get update -yqq && \
pecl channel-update pecl.php.net && \
apt-get install -yqq wget git lrzsz gnupg2 apt-utils gnupg2 libjpeg-dev libbz2-dev \
      libpng-dev \
      libfreetype6-dev \
      libssl-dev \
      libwebp-dev \
      libxpm-dev \
      libmcrypt-dev \
      libonig-dev 

ARG DEFAULT_GROUP_UID=1001
ARG DEFAULT_USER_UID=1001
ARG DEFAULT_GROUP_NAME=sora
ARG DEFAULT_USER_NAME=sora
RUN groupadd -g ${DEFAULT_GROUP_UID} ${DEFAULT_GROUP_NAME}
RUN useradd -u ${DEFAULT_USER_UID} -g ${DEFAULT_USER_NAME} ${DEFAULT_GROUP_NAME}

#安装pdo_mysql
RUN docker-php-ext-install pdo_mysql

#安装GD库
RUN docker-php-ext-configure gd  --prefix=/usr  --with-jpeg --with-webp --with-xpm --with-freetype && \
docker-php-ext-install gd

#安装bz2
RUN docker-php-ext-install bz2

#安装sockets
RUN docker-php-ext-install sockets

#安装 zip
RUN apt-get install -yqq libzip-dev zip unzip && \
docker-php-ext-configure zip && \
docker-php-ext-install zip

#安装 pcntl (进程控制)
RUN docker-php-ext-install pcntl

#安装 bcmath (数学扩展)
RUN docker-php-ext-install bcmath

#安装 Exif (文件扩展)
RUN docker-php-ext-install exif 

#安装 redis 
RUN pecl install -o -f redis && \
rm -rf /tmp/pear && \
docker-php-ext-enable redis

#安装 Mysqli 
RUN docker-php-ext-install mysqli 

#清理日志相关
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -f /var/log/lastlog /var/log/faillog


#安装composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

WORKDIR /usr/share/nginx/html/php7
CMD ["php-fpm"]
