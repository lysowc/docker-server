#!/bin/bash

#当前所在的路径
root_path=$(pwd)

# 读取配置相关的路径
while true; do
    echo "请输入配置相关路径(输入错误直接回车，后续有确认,默认路径 /home/sora/server )："
    echo "--------------------------------------------"
    read dir

    if [ -z "$dir" ]; then
        dir=/home/sora/server
        break
    else
        echo "您输入的路径是：$dir"
        read -p "确认路径正确吗？[y/n] " choice
        case $choice in
            [Yy])
                break
                ;;
            [Nn])
                continue
                ;;
            *)
                echo "无效的选择，请重新输入。"
                continue
                ;;
        esac
    fi
done
echo "您的目录是[ $dir ]"
echo "--------------------------------------------"

#判断目录是否存在,不存在则创建
if [ ! -d "$dir" ]; then
    echo "准备创建目录..."
    echo "--------------------------------------------"
    mkdir -p $dir
    echo "目录[ $dir ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir ]已存在"
    echo "--------------------------------------------"
fi

#创建 redis 目录
if [ ! -d "$dir/redis" ]; then
    echo "准备创建[ $dir/redis ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/redis
    echo "目录[ $dir/redis ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/redis ]已存在"
    echo "--------------------------------------------"
fi

#创建 mysql 目录
if [ ! -d "$dir/mysql" ]; then
    echo "准备创建[ $dir/mysql ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/mysql
    echo "目录[ $dir/mysql ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/mysql ]已存在"
    echo "--------------------------------------------"
fi

#创建 php 目录
if [ ! -d "$dir/php" ]; then
    echo "准备创建[ $dir/php ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/php
    echo "目录[ $dir/php ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/php ]已存在"
    echo "--------------------------------------------"
fi

#创建 mysql 目录
if [ ! -d "$dir/nginx" ]; then
    echo "准备创建[ $dir/nginx ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/nginx
    echo "目录[ $dir/nginx ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/nginx ]已存在"
    echo "--------------------------------------------"
fi

#配置nginx
echo "准备配置 nginx..."
echo "--------------------------------------------"

#日志目录
if [ ! -d "$dir/nginx/logs" ]; then
    echo "准备创建[ $dir/nginx/logs ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/nginx/logs
	chmod 777 $dir/nginx/logs
    echo "目录[ $dir/nginx/logs ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/nginx/logs ]已存在"
    echo "--------------------------------------------"
fi

echo "准备复制配置文件..."
cp -r $root_path/docker-server/nginx/conf.d $dir/nginx
cp $root_path/docker-server/nginx/nginx.conf $dir/nginx

echo "配置文件复制完成..."
echo "--------------------------------------------"
echo "nginx 配置完成!"
echo "--------------------------------------------"



#配置 mysql
echo "准备配置 mysql..."
echo "--------------------------------------------"

#数据目录
#if [ ! -d "$dir/mysql/data" ]; then
#    echo "准备创建[ $dir/mysql/data ]目录..."
#    echo "--------------------------------------------"
#    mkdir -p $dir/mysql/data
#    echo "目录[ $dir/mysql/data ]创建完成!"
#    echo "--------------------------------------------"
#else
#    echo "目录[ $dir/mysql/data ]已存在"
#    echo "--------------------------------------------"
#fi
#
##binlog目录
#if [ ! -d "$dir/mysql/bin" ]; then
#    echo "准备创建[ $dir/mysql/bin ]目录..."
#    echo "--------------------------------------------"
#    mkdir -p $dir/mysql/bin
#    echo "目录[ $dir/mysql/bin ]创建完成!"
#    echo "--------------------------------------------"
#else
#    echo "目录[ $dir/mysql/bin ]已存在"
#    echo "--------------------------------------------"
#fi
#
#日志目录
if [ ! -d "$dir/mysql/logs" ]; then
    echo "准备创建[ $dir/mysql/logs ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/mysql/logs
    echo "目录[ $dir/mysql/logs ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/mysql/logs ]已存在"
    echo "--------------------------------------------"
fi
#
##慢日志目录
#if [ ! -d "$dir/mysql/slow" ]; then
#    echo "准备创建[ $dir/mysql/slow ]目录..."
#    echo "--------------------------------------------"
#    mkdir -p $dir/mysql/slow
#    echo "目录[ $dir/mysql/slow ]创建完成!"
#    echo "--------------------------------------------"
#else
#    echo "目录[ $dir/mysql/slow ]已存在"
#    echo "--------------------------------------------"
#fi

echo "准备复制配置文件..."
cp $root_path/docker-server/mysql/my.cnf $dir/mysql
cp -r $root_path/docker-server/mysql/bin $dir/mysql
cp -r $root_path/docker-server/mysql/data $dir/mysql
cp -r $root_path/docker-server/mysql/slow $dir/mysql
cp -r $root_path/docker-server/mysql/docker-entrypoint-initdb.d $dir/mysql

echo "配置文件复制完成..."
echo "--------------------------------------------"
echo "mysql 配置完成!"
echo "--------------------------------------------"



#配置 redis
echo "准备配置 redis..."
echo "--------------------------------------------"

#日志目录
if [ ! -d "$dir/redis/logs" ]; then
    echo "准备创建[ $dir/redis/logs ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/redis/logs
	chmod 777 $dir/redis/logs
    echo "目录[ $dir/redis/logs ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/redis/logs ]已存在"
    echo "--------------------------------------------"
fi

#数据目录
#if [ ! -d "$dir/redis/data" ]; then
#    echo "准备创建[ $dir/redis/data ]目录..."
#    echo "--------------------------------------------"
#    mkdir -p $dir/redis/data
#    echo "目录[ $dir/redis/data ]创建完成!"
#    echo "--------------------------------------------"
#else
#    echo "目录[ $dir/redis/data ]已存在"
#    echo "--------------------------------------------"
#fi

echo "准备复制配置文件..."
cp -r $root_path/docker-server/redis/data $dir/redis
cp $root_path/docker-server/redis/redis.conf $dir/redis

echo "配置文件复制完成..."
echo "--------------------------------------------"
echo "redis 配置完成!"
echo "--------------------------------------------"




#配置 php
echo "准备配置 php..."
echo "--------------------------------------------"

#日志目录
if [ ! -d "$dir/php/logs" ]; then
    echo "准备创建[ $dir/php/logs ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/php/logs
	chmod 777 $dir/php/logs
    echo "目录[ $dir/php/logs ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/php/logs ]已存在"
    echo "--------------------------------------------"
fi

#fpm配置目录
if [ ! -d "$dir/php/php-fpm.d" ]; then
    echo "准备创建[ $dir/php/php-fpm.d ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/php/php-fpm.d
    echo "目录[ $dir/php/php-fpm.d ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/php/php-fpm.d ]已存在"
    echo "--------------------------------------------"
fi

echo "准备复制配置文件..."
cp -r $root_path/docker-server/php/php8/fpm/php.ini $dir/php
cp -r $root_path/docker-server/php/php8/fpm/zz-docker.conf $dir/php/php-fpm.d

echo "配置文件复制完成..."
echo "--------------------------------------------"
echo "php 配置完成!"
echo "--------------------------------------------"
