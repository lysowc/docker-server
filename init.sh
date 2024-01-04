#!/bin/bash
if [ -z $1 ]
then
   echo "项目根路径不可为空"
   exit
fi

dir=/home/sora/server

if [ ! -d "$dir" ]; then
  mkdir -p $dir
fi

cd $dir
mkdir -p mysql redis php nginx

#配置nginx
cd nginx
mkdir logs
chmod 777 logs
cp -r $1/docker-server/nginx/conf.d ./
cp $1/docker-server/nginx/nginx.conf ./

#配置mysql
cd $dir/mysql
mkdir data bin logs slow
cp -r $1/docker-server/mysql/my.cnf ./
cp -r $1/docker-server/mysql/docker-entrypoint-initdb.d/ ./


#配置redis
cd $dir/redis
mkdir -p logs data
cp $1/docker-server/redis/redis.conf ./
chmod 777 -R logs

#配置php
cd $dir/php
cp $1/docker-server/php/php8/fpm/php.ini ./
mkdir php-fpm.d log
cd php-fpm.d/
cp $1/docker-server/php/php8/fpm/zz-docker.conf ./

