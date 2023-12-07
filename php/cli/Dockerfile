#zts版本
FROM php:8.2.10-cli

LABEL maintainer="lysowc <lysowc@gmail.com>" version="0.01" license="MIT" describe="local-server"

#替换apt源
RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list.d/debian.sources && \
sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list.d/debian.sources && \
sed -i 's/security-cdn.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list.d/debian.sources

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

#安装pdo_mysql
RUN docker-php-ext-install pdo_mysql

#安装GD库
RUN docker-php-ext-configure gd  --prefix=/usr  --with-jpeg --with-webp --with-xpm --with-freetype && \
docker-php-ext-install gd

#安装bz2
RUN docker-php-ext-install bz2

#安装protobuf
RUN pecl install protobuf && \
docker-php-ext-enable protobuf

#安装sockets
RUN docker-php-ext-install sockets

#安装 zip
RUN apt-get install -yqq libzip-dev zip unzip && \
docker-php-ext-configure zip && \
docker-php-ext-install zip

#安装 xlswriter (操作xls，用c语言开发PHP扩展) 
RUN set -eux && \
pecl install xlswriter && \
docker-php-ext-enable xlswriter

#安装 pcntl (进程控制)
RUN docker-php-ext-install pcntl

#安装 bcmath (数学扩展)
RUN docker-php-ext-install bcmath

#安装 Memcached
#RUN pecl -q install memcached && \
#docker-php-ext-enable memcached
###### 报错: > [ 8/37] RUN pecl -q install memcached && docker-php-ext-enable memcached:
#6.888 pecl/memcached can optionally use PHP extension "igbinary" (version >= 2.0)
#6.888 pecl/memcached can optionally use PHP extension "msgpack" (version >= 2.0)

#安装 Exif (文件扩展)
RUN docker-php-ext-install exif 

#安装 Enchant (该库提供了一系列的拼写检查、语法检查、词典管理等功能)
#RUN apt-get install -yqq libenchant-dev && \
#docker-php-ext-install enchant
#报错：0.782 E: Unable to locate package libenchant-dev

#安装 GMP (开源的数学运算库，它可以用于任意精度的数学运算，包括有符号整数、有理数和浮点数。它本身并没有精度限制，只取决于机器的硬件情况。)
RUN apt-get -yqq install libgmp-dev && \
docker-php-ext-install gmp

#安装 GnuPG (加密、解密和签名数据的扩展)
RUN apt-get -yqq install libgpgme-dev && \
pecl install gnupg && \
docker-php-ext-enable gnupg

##安装 SSH2 (远程操作服务器相关)
#RUN apt-get -yqq install libssh2-1-dev && \
#pecl install -a ssh2 && \
#docker-php-ext-enable ssh2 

##安装 libfaketime (改变应用程序的时间，不改变系统的时间)
#USER root
#RUN apt-get -yqq install libfaketime
#RUN echo "/usr/lib/x86_64-linux-gnu/faketime/libfaketime.so.1" > /etc/ld.so.preload

#安装 soap (在网络上进行分布式通信和交换结构化数据的协议)
RUN rm /etc/apt/preferences.d/no-debian-php && \
apt-get -yqq install libxml2-dev php-soap && \
docker-php-ext-install soap 

##安装 XSL (对XML文档进行转换和呈现)
#RUN apt-get -yqq install libxslt-dev && \
#docker-php-ext-install xsl  

#安装 xDebug (单步调试工具)
RUN pecl install xdebug && \
docker-php-ext-enable xdebug
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
RUN sed -i "s/xdebug.remote_host=/xdebug.client_host=/" /usr/local/etc/php/conf.d/xdebug.ini && \
sed -i "s/xdebug.remote_connect_back=0/xdebug.discover_client_host=false/" /usr/local/etc/php/conf.d/xdebug.ini && \
sed -i "s/xdebug.remote_port=9000/xdebug.client_port=${XDEBUG_PORT}/" /usr/local/etc/php/conf.d/xdebug.ini && \
sed -i "s/xdebug.profiler_enable=0/; xdebug.profiler_enable=0/" /usr/local/etc/php/conf.d/xdebug.ini && \
sed -i "s/xdebug.profiler_output_dir=/xdebug.output_dir=/" /usr/local/etc/php/conf.d/xdebug.ini && \
sed -i "s/xdebug.remote_mode=req/; xdebug.remote_mode=req/" /usr/local/etc/php/conf.d/xdebug.ini && \
sed -i "s/xdebug.remote_autostart=0/xdebug.start_with_request=yes/" /usr/local/etc/php/conf.d/xdebug.ini && \
sed -i "s/xdebug.remote_enable=0/xdebug.mode=debug/" /usr/local/etc/php/conf.d/xdebug.ini && \
sed -i "s/xdebug.cli_color=0/xdebug.cli_color=1/" /usr/local/etc/php/conf.d/xdebug.ini

##安装 pcov (xdebug的替代品，更轻量级)
#USER root
#RUN pecl install pcov && \
#docker-php-ext-enable pcov 

#安装 redis 
RUN pecl install -o -f redis && \
rm -rf /tmp/pear && \
docker-php-ext-enable redis

#安装 swoole 
RUN set -eux && \
pecl install swoole && \
docker-php-ext-enable swoole

#安装 MongoDB 
#RUN pecl install mongodb && \
#docker-php-ext-enable mongodb

#安装 AMQP (和消息队列通信的扩展) 
RUN set -eux && \
apt-get -yqq install librabbitmq-dev && \
pecl install amqp && \
docker-php-ext-enable amqp

##安装 Gearman (Gearman 分布式任务队列系统进行交互的PHP扩展，提供了发送和接收任务、工作服务器和客户端之间的通信功能。)
#RUN apt-get -y install libgearman-dev && \
#cd /tmp && \
#curl -L https://github.com/wcgallego/pecl-gearman/archive/gearman-2.0.5.zip -O && \
#unzip gearman-2.0.5.zip && \
#mv pecl-gearman-gearman-2.0.5 pecl-gearman && \
#cd /tmp/pecl-gearman && \
#phpize && \
#./configure && \
#make -j$(nproc) && \
#make install && \
#cd / && \
#rm /tmp/gearman-2.0.5.zip && \
#rm -r /tmp/pecl-gearman && \
#docker-php-ext-enable gearman

#安装 Opcache (缓存加速php)
RUN docker-php-ext-install opcache
COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini

#安装 Mysqli 
RUN docker-php-ext-install mysqli 

#安装 intl （国际化语言支持） 
RUN apt-get install -yqq zlib1g-dev libicu-dev g++ && \
docker-php-ext-configure intl && \
docker-php-ext-install intl 

##安装 SMB （网络共享资源（如文件、打印机等）进行交互的功能） 
#RUN apt-get install -yqq smbclient libsmbclient-dev coreutils && \
#pecl install smbclient  && \
#docker-php-ext-enable smbclient  

#安装 imap （邮件相关） 
RUN apt-get install -yqq libc-client-dev libkrb5-dev && \
docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
docker-php-ext-install imap

#安装 Calendar （日历扩展） 
#USER root
#RUN docker-php-ext-configure calendar && \
#docker-php-ext-install calendar

#安装 phalcon （针对高性能优化的 PHP 框架） 
#RUN apt-get install -yqq libpcre3-dev && \
#pecl install phalcon && \
#docker-php-ext-enable  phalcon  

#安装 apcu （高速缓存机制,可用于提高应用程序的性能和响应速度） 
RUN pecl install apcu && \
docker-php-ext-enable  apcu  

#安装 yaml （允许PHP开发者在他们的应用程序中直接操作YAML格式的数据） 
RUN apt-get install libyaml-dev -y && \
pecl install yaml && \
docker-php-ext-enable  yaml  


#安装 RDKAFKA （Kafka的PHP扩展） 
RUN apt-get install -yqq librdkafka-dev && \
pecl install rdkafka  && \
docker-php-ext-enable  rdkafka   


#安装 GETTEXT  （多语言处理库） 
RUN apt-get install -yqq zlib1g-dev libicu-dev g++ libpq-dev libssl-dev gettext && \
docker-php-ext-install gettext

#安装 GETTEXT  （解析和处理电子邮件的扩展） 
RUN pecl install -o -f mailparse && \
rm -rf /tmp/pear && \
docker-php-ext-enable mailparse

#安装 XMLRPC  （远程过程调用的协议,它使用HTTP作为传输协议,并使用XML格式进行数据交互。）
RUN apt-get -yq install libxml2-dev && \
pecl install xmlrpc-1.0.0RC3 \
docker-php-ext-enable xmlrpc

#安装 DECIMAL  （解决浮点数精度问题的一个类。安装比较慢）
#USER root
#RUN curl -L -o /tmp/mpdecimal.tar.gz "https://www.bytereef.org/software/mpdecimal/releases/mpdecimal-2.5.1.tar.gz" && \
#mkdir -p /tmp/mpdecimal && \
#tar -C /tmp/mpdecimal -zxvf /tmp/mpdecimal.tar.gz --strip 1 && \
#cd /tmp/mpdecimal && \
#./configure && make && make install && \
#pecl install decimal && \
#docker-php-ext-enable decimal


#安装 Event  （事件库。安装比较慢）
#USER root
#RUN set -eux && \
#curl -L -o  /tmp/libevent.tar.gz https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz   &&\
#mkdir -p /tmp/libevent-php &&\
#tar -C /tmp/libevent-php -zxvf /tmp/libevent.tar.gz --strip 1 &&\
#cd /tmp/libevent-php &&\
#./configure --prefix=/usr/local/libevent-2.1.12  &&\
#make &&\
#make install &&\
#rm /tmp/libevent.tar.gz &&\
#docker-php-ext-install sockets  &&\
#curl -L -o /tmp/event.tar.gz http://pecl.php.net/get/event-3.0.6.tgz &&\
#mkdir -p /tmp/event-php &&\
#tar -C /tmp/event-php -zxvf /tmp/event.tar.gz --strip 1 &&\
#cd /tmp/event-php &&\
#phpize &&\
#./configure  --with-event-libevent-dir=/usr/local/libevent-2.1.12/ &&\
#make &&\
#make install &&\
#rm /tmp/event.tar.gz &&\
#docker-php-ext-enable event

#清理日志相关
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -f /var/log/lastlog /var/log/faillog


WORKDIR /var/www

