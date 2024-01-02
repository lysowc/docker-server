#!/bin/bash
if [ -z $1 ]
then
   echo "项目根路径不可为空"
   exit
fi

cd /usr/local/
mkdir -p mysql redis php nginx

#配置nginx
cd nginx
mkdir logs
chmod 777 logs
cp -r $1/docker-server/nginx/conf.d ./
cp $1/docker-server/nginx/nginx.conf ./
cd ..

#配置mysql
cd mysql
mkdir -p data logs
chmod 777 logs
cp -r $1/docker-server/mysql/conf.d ./
cp -r $1/docker-server/mysql/docker-entrypoint-initdb.d/ ./


#配置redis
cd /usr/local/redis/
mkdir -p logs data
cp $1/docker-server/redis/redis.conf ./
chmod 777 logs/ data/

#配置php
cd /usr/local/php/
cp $1/docker-server/php/php8/fpm/php.ini ./
mkdir php-fpm.d
cd php-fpm.d/
cp $1/docker-server/php/php8/fpm/zz-docker.conf ./

