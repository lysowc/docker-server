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
cp -r $1/docker-server/nginx/* ./
cd ..

#配置mysql
cd mysql
mkdir -p data logs conf.d
chmod 766 logs/
cd conf.d/
cp $1/docker-server/mysql/my.cnf ./
cp -r $1/docker-server/mysql/docker-entrypoint-initdb.d/ ./


#配置redis
cd /usr/local/redis/
mkdir -p logs data conf
cd conf/
cp $1/docker-server/redis/redis.conf ./
cd ..
chmod 777 logs/ data/

#配置php
cd /usr/local/php/
mkdir php-fpm.d
cd php-fpm.d/
cp -r $1/docker-server/php/fpm/www.conf ./

