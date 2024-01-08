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

#创建 php-fpm 目录
if [ ! -d "$dir/fpm" ]; then
    echo "准备创建[ $dir/fpm ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/fpm
    echo "目录[ $dir/fpm ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/fpm ]已存在"
    echo "--------------------------------------------"
fi

#创建 php-fpm7 目录
if [ ! -d "$dir/fpm7" ]; then
    echo "准备创建[ $dir/fpm7 ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/fpm7
    echo "目录[ $dir/fpm7 ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/fpm7 ]已存在"
    echo "--------------------------------------------"
fi

#创建 php-zts 目录
if [ ! -d "$dir/zts" ]; then
    echo "准备创建[ $dir/zts ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/zts
    echo "目录[ $dir/zts ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/zts ]已存在"
    echo "--------------------------------------------"
fi

#创建 php-cli 目录
if [ ! -d "$dir/cli" ]; then
    echo "准备创建[ $dir/cli ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/cli
    echo "目录[ $dir/cli ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/cli ]已存在"
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
cp -r $root_path/nginx/conf.d $dir/nginx
cp $root_path/nginx/nginx.conf $dir/nginx
echo "配置文件复制完成..."
echo "--------------------------------------------"
echo "nginx 配置完成!"
echo "--------------------------------------------"


#配置 mysql
echo "准备配置 mysql..."
echo "--------------------------------------------"
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
#二进制日志目录
if [ ! -d "$dir/mysql/bin" ]; then
    echo "准备创建[ $dir/mysql/bin ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/mysql/bin
    echo "目录[ $dir/mysql/bin ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/mysql/bin ]已存在"
    echo "--------------------------------------------"
fi
#慢日志目录
if [ ! -d "$dir/mysql/slow" ]; then
    echo "准备创建[ $dir/mysql/slow ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/mysql/slow
    echo "目录[ $dir/mysql/slow ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/mysql/slow ]已存在"
    echo "--------------------------------------------"
fi
#数据目录
if [ ! -d "$dir/mysql/data" ]; then
    echo "准备创建[ $dir/mysql/data ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/mysql/data
    echo "目录[ $dir/mysql/data ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/mysql/data ]已存在"
    echo "--------------------------------------------"
fi
echo "准备复制配置文件..."
cp $root_path/mysql/my.cnf $dir/mysql
cp -r $root_path/mysql/docker-entrypoint-initdb.d $dir/mysql
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
echo "准备复制配置文件..."
cp -r $root_path/redis/data $dir/redis
cp $root_path/redis/redis.conf $dir/redis
echo "配置文件复制完成..."
echo "--------------------------------------------"
echo "redis 配置完成!"
echo "--------------------------------------------"




#配置 php-fpm
echo "准备配置 php-fpm..."
echo "--------------------------------------------"
#日志目录
if [ ! -d "$dir/fpm/logs" ]; then
    echo "准备创建[ $dir/fpm/logs ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/fpm/logs
	chmod 777 $dir/fpm/logs
    echo "目录[ $dir/fpm/logs ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/fpm/logs ]已存在"
    echo "--------------------------------------------"
fi
echo "准备复制配置文件..."
cp $root_path/php/php8/fpm/php.ini $dir/fpm
cp $root_path/php/php8/fpm/zz-docker.conf $dir/fpm
echo "配置文件复制完成..."
echo "--------------------------------------------"
echo "php-fpm 配置完成!"
echo "--------------------------------------------"

#配置 php-fpm7
echo "准备配置 php-fpm7..."
echo "--------------------------------------------"
#日志目录
if [ ! -d "$dir/fpm7/logs" ]; then
    echo "准备创建[ $dir/fpm7/logs ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/fpm7/logs
	chmod 777 $dir/fpm7/logs
    echo "目录[ $dir/fpm7/logs ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/fpm7/logs ]已存在"
    echo "--------------------------------------------"
fi
echo "准备复制配置文件..."
cp $root_path/php/php7/fpm/php.ini $dir/fpm7
cp $root_path/php/php7/fpm/zz-docker.conf $dir/fpm7
echo "配置文件复制完成..."
echo "--------------------------------------------"
echo "php-fpm7 配置完成!"
echo "--------------------------------------------"

#配置 php-zts
echo "准备配置 php-zts..."
echo "--------------------------------------------"
#日志目录
if [ ! -d "$dir/zts/logs" ]; then
    echo "准备创建[ $dir/zts/logs ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/zts/logs
	chmod 777 $dir/zts/logs
    echo "目录[ $dir/zts/logs ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/zts/logs ]已存在"
    echo "--------------------------------------------"
fi
echo "准备复制配置文件..."
cp $root_path/php/php8/zts/php.ini $dir/zts
echo "配置文件复制完成..."
echo "--------------------------------------------"
echo "php-zts 配置完成!"
echo "--------------------------------------------"


#配置 php-cli
echo "准备配置 php-cli..."
echo "--------------------------------------------"
#日志目录
if [ ! -d "$dir/cli/logs" ]; then
    echo "准备创建[ $dir/cli/logs ]目录..."
    echo "--------------------------------------------"
    mkdir -p $dir/cli/logs
	chmod 777 $dir/cli/logs
    echo "目录[ $dir/cli/logs ]创建完成!"
    echo "--------------------------------------------"
else
    echo "目录[ $dir/cli/logs ]已存在"
    echo "--------------------------------------------"
fi
echo "准备复制配置文件..."
cp $root_path/php/php8/cli/php.ini $dir/cli
echo "配置文件复制完成..."
echo "--------------------------------------------"
echo "php-cli 配置完成!"
echo "--------------------------------------------"

