#zts版本
FROM php:8.2.10-cli

LABEL maintainer="lysoulwc <lysowc@gmail.com>" version="0.01" license="MIT" describe="local-server"

#替换apt源
RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list.d/debian.sources && \
sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list.d/debian.sources && \
sed -i 's/security-cdn.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list.d/debian.sources

#安装一些依赖库
RUN apt-get update -yqq && \
pecl channel-update pecl.php.net && \
apt-get install -yqq wget git lrzsz gnupg2 apt-utils gnupg2 unzip

ARG DEFAULT_GROUP_UID=1001
ARG DEFAULT_USER_UID=1001
ARG DEFAULT_GROUP_NAME=sora
ARG DEFAULT_USER_NAME=sora
RUN groupadd -g ${DEFAULT_GROUP_UID} ${DEFAULT_GROUP_NAME}
RUN useradd -s /bin/bash -m -u ${DEFAULT_USER_UID} -g ${DEFAULT_USER_NAME} ${DEFAULT_GROUP_NAME}

RUN apt-get install -y libmagickwand-dev libmagickcore-dev

RUN pecl install imagick \  
    && docker-php-ext-enable imagick

ARG DEFAULT_PHP_EXT_GD=false
RUN if [ ${DEFAULT_PHP_EXT_GD} = true ]; then \
    apt install -y libpng-dev libjpeg-dev && \
    docker-php-ext-install gd \
;fi


ARG DEFAULT_PHP_EXT_BCMATH=false
RUN if [ ${DEFAULT_PHP_EXT_BCMATH} = true ]; then \
    docker-php-ext-install bcmath \
;fi

ARG DEFAULT_PHP_EXT_CALENDAR=false
RUN if [ ${DEFAULT_PHP_EXT_CALENDAR} = true ]; then \
    docker-php-ext-install calendar \
;fi

ARG DEFAULT_PHP_EXT_DBA=false
RUN if [ ${DEFAULT_PHP_EXT_DBA} = true ]; then \
    docker-php-ext-install dba \
;fi

ARG DEFAULT_PHP_EXT_DL_TEST=false
RUN if [ ${DEFAULT_PHP_EXT_DL_TEST} = true ]; then \
    docker-php-ext-install dl_test \
;fi

ARG DEFAULT_PHP_EXT_EXIF=false
RUN if [ ${DEFAULT_PHP_EXT_EXIF} = true ]; then \
    docker-php-ext-install exif \
;fi

ARG DEFAULT_PHP_EXT_GETTEXT=false
RUN if [ ${DEFAULT_PHP_EXT_GETTEXT} = true ]; then \
    docker-php-ext-install gettext \
;fi

ARG DEFAULT_PHP_EXT_MYSQLI=false
RUN if [ ${DEFAULT_PHP_EXT_MYSQLI} = true ]; then \
    docker-php-ext-install mysqli \
;fi

ARG DEFAULT_PHP_EXT_PCNTL=false
RUN if [ ${DEFAULT_PHP_EXT_PCNTL} = true ]; then \
    docker-php-ext-install pcntl \
;fi

ARG DEFAULT_PHP_EXT_PDO=false
RUN if [ ${DEFAULT_PHP_EXT_PDO} = true ]; then \
    docker-php-ext-install pdo \
;fi

ARG DEFAULT_PHP_EXT_PDO_MYSQL=false
RUN if [ ${DEFAULT_PHP_EXT_PDO_MYSQL} = true ]; then \
    docker-php-ext-install pdo_mysql \
;fi

ARG DEFAULT_PHP_EXT_SHMOP=false
RUN if [ ${DEFAULT_PHP_EXT_SHMOP} = true ]; then \
    docker-php-ext-install shmop \
;fi

ARG DEFAULT_PHP_EXT_SOCKETS=false
RUN if [ ${DEFAULT_PHP_EXT_SOCKETS} = true ]; then \
    docker-php-ext-install sockets \
;fi

ARG DEFAULT_PHP_EXT_SYSVMSG=false
RUN if [ ${DEFAULT_PHP_EXT_SYSVMSG} = true ]; then \
    docker-php-ext-install sysvmsg \
;fi

ARG DEFAULT_PHP_EXT_SYSVSEM=false
RUN if [ ${DEFAULT_PHP_EXT_SYSVSEM} = true ]; then \
    docker-php-ext-install sysvsem \
;fi

ARG DEFAULT_PHP_EXT_SYSVSHM=false
RUN if [ ${DEFAULT_PHP_EXT_SYSVSHM} = true ]; then \
    docker-php-ext-install sysvshm \
;fi

ARG DEFAULT_PHP_EXT_BZ2=false
RUN if [ ${DEFAULT_PHP_EXT_BZ2} = true ]; then \
    apt install -y libbz2-dev && \
    docker-php-ext-install bz2 \
;fi

ARG DEFAULT_PHP_EXT_FFI=false
RUN if [ ${DEFAULT_PHP_EXT_FFI} = true ]; then \
    apt install -y libffi-dev && \
    docker-php-ext-install ffi \
;fi

ARG DEFAULT_PHP_EXT_GMP=false
RUN if [ ${DEFAULT_PHP_EXT_GMP} = true ]; then \
    apt install -y libgmp-dev && \
    docker-php-ext-install gmp \
;fi

ARG DEFAULT_PHP_EXT_INTL=false
RUN if [ ${DEFAULT_PHP_EXT_INTL} = true ]; then \
    apt install -y libicu-dev && \
    docker-php-ext-install intl \
;fi

ARG DEFAULT_PHP_EXT_LDAP=false
RUN if [ ${DEFAULT_PHP_EXT_LDAP} = true ]; then \
    apt install -y libldap2-dev && \
    docker-php-ext-install ldap \
;fi

ARG DEFAULT_PHP_EXT_PDO_DBLIB=false
RUN if [ ${DEFAULT_PHP_EXT_PDO_DBLIB} = true ]; then \
    apt install -y freetds-dev && \
    docker-php-ext-install pdo_dblib \
;fi

ARG DEFAULT_PHP_EXT_PSPELL=false
RUN if [ ${DEFAULT_PHP_EXT_PSPELL} = true ]; then \
    apt install -y libpspell-dev && \
    docker-php-ext-install pspell \
;fi

ARG DEFAULT_PHP_EXT_SNMP=false
RUN if [ ${DEFAULT_PHP_EXT_SNMP} = true ]; then \
    apt install -y libsnmp-dev && \
    docker-php-ext-install snmp \
;fi

ARG DEFAULT_PHP_EXT_SOAP=false
RUN if [ ${DEFAULT_PHP_EXT_SOAP} = true ]; then \
    apt install -y libxml2-dev && \
    docker-php-ext-install soap \
;fi

ARG DEFAULT_PHP_EXT_TIDY=false
RUN if [ ${DEFAULT_PHP_EXT_TIDY} = true ]; then \
    apt install -y libtidy-dev && \
    docker-php-ext-install tidy \
;fi

ARG DEFAULT_PHP_EXT_XSL=false
RUN if [ ${DEFAULT_PHP_EXT_XSL} = true ]; then \
    apt install -y libxslt-dev && \
    docker-php-ext-install xsl \
;fi

ARG DEFAULT_PHP_EXT_ZIP=false
RUN if [ ${DEFAULT_PHP_EXT_ZIP} = true ]; then \
    apt install -y libzip-dev && \
    docker-php-ext-install zip \
;fi

ARG DEFAULT_PHP_EXT_OPCACHE=false
RUN if [ ${DEFAULT_PHP_EXT_OPCACHE} = true ]; then \
    docker-php-ext-install opcache \
;fi
COPY ./opcache.ini  /usr/local/etc/php/conf.d/opcache.ini

ARG DEFAULT_PHP_EXT_PROTOBUF=false
RUN if [ ${DEFAULT_PHP_EXT_PROTOBUF} = true ]; then \
    pecl install protobuf && \
    docker-php-ext-enable protobuf \
;fi

ARG DEFAULT_PHP_EXT_XLSWRITER=false
RUN if [ ${DEFAULT_PHP_EXT_XLSWRITER} = true ]; then \
    pecl install xlswriter && \
    docker-php-ext-enable xlswriter \
;fi

ARG DEFAULT_PHP_EXT_REDIS=false
RUN if [ ${DEFAULT_PHP_EXT_REDIS} = true ]; then \
    pecl install redis && \
    docker-php-ext-enable redis \
;fi

ARG DEFAULT_PHP_EXT_SWOOLE=false
RUN if [ ${DEFAULT_PHP_EXT_SWOOLE} = true ]; then \
    pecl install swoole && \
    docker-php-ext-enable swoole \
;fi

ARG DEFAULT_PHP_EXT_MONGODB=false
RUN if [ ${DEFAULT_PHP_EXT_MONGODB} = true ]; then \
    pecl install mongodb && \
    docker-php-ext-enable mongodb \
;fi

ARG DEFAULT_PHP_EXT_APCU=false
RUN if [ ${DEFAULT_PHP_EXT_APCU} = true ]; then \
    pecl install apcu && \
    docker-php-ext-enable apcu \
;fi

ARG DEFAULT_PHP_EXT_MAILPARSE=false
RUN if [ ${DEFAULT_PHP_EXT_MAILPARSE} = true ]; then \
    pecl install mailparse && \
    docker-php-ext-enable mailparse \
;fi

ARG DEFAULT_PHP_EXT_XMLRPC=false
RUN if [ ${DEFAULT_PHP_EXT_XMLRPC} = true ]; then \
    pecl install xmlrpc-1.0.0RC3 && \
    docker-php-ext-enable xmlrpc \
;fi

ARG DEFAULT_PHP_EXT_GNUPG=false
RUN if [ ${DEFAULT_PHP_EXT_GNUPG} = true ]; then \
    apt install -y libgpgme-dev && \
    pecl install gnupg && \
    docker-php-ext-enable gnupg \
;fi

ARG DEFAULT_PHP_EXT_SSH2=false
RUN if [ ${DEFAULT_PHP_EXT_SSH2} = true ]; then \
    apt install -y libssh2-1-dev && \
    pecl install ssh2 && \
    docker-php-ext-enable ssh2 \
;fi

ARG DEFAULT_PHP_EXT_AMQP=false
RUN if [ ${DEFAULT_PHP_EXT_AMQP} = true ]; then \
    apt install -y librabbitmq-dev && \
    pecl install amqp && \
    docker-php-ext-enable amqp \
;fi

ARG DEFAULT_PHP_EXT_SMBCLIENT=false
RUN if [ ${DEFAULT_PHP_EXT_SMBCLIENT} = true ]; then \
    apt install -y smbclient libsmbclient-dev coreutils && \
    pecl install smbclient && \
    docker-php-ext-enable smbclient \
;fi

ARG DEFAULT_PHP_EXT_YAML=false
RUN if [ ${DEFAULT_PHP_EXT_YAML} = true ]; then \
    apt install -y libyaml-dev && \
    pecl install yaml && \
    docker-php-ext-enable yaml \
;fi

ARG DEFAULT_PHP_EXT_RDKAFKA=false
RUN if [ ${DEFAULT_PHP_EXT_RDKAFKA} = true ]; then \
    apt install -y librdkafka-dev && \
    pecl install rdkafka && \
    docker-php-ext-enable rdkafka \
;fi

ARG DEFAULT_PHP_EXT_PHALCON=false
RUN if [ ${DEFAULT_PHP_EXT_PHALCON} = true ]; then \
    apt install -y libpcre3-dev && \
    pecl install phalcon && \
    docker-php-ext-enable phalcon \
;fi

ARG DEFAULT_PHP_EXT_LIBFAKETIME=false
RUN if [ ${DEFAULT_PHP_EXT_LIBFAKETIME} = true ]; then \
    apt install -y libfaketime && \
    echo "/usr/lib/x86_64-linux-gnu/faketime/libfaketime.so.1" > /etc/ld.so.preload \
;fi

ARG DEFAULT_PHP_EXT_XDEBUG=false
RUN if [ ${DEFAULT_PHP_EXT_XDEBUG} = true ]; then \
    pecl install xdebug && \
    docker-php-ext-enable xdebug \
;fi
COPY ./xdebug.ini  /usr/local/etc/php/conf.d/xdebug.ini

ARG DEFAULT_PHP_EXT_EVENT=false
RUN if [ ${DEFAULT_PHP_EXT_EVENT} = true ]; then \
    apt install -y libevent-dev && \
    pecl install event && \
    docker-php-ext-enable event \
;fi

#socket 扩展要优先于event加载
RUN mv /usr/local/etc/php/conf.d/docker-php-ext-event.ini  /usr/local/etc/php/conf.d/docker-php-ext-zevent.ini
#清理日志相关
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -f /var/log/lastlog /var/log/faillog


#安装composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

WORKDIR /home/${DEFAULT_USER_NAME}
