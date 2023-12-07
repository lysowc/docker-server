#!/bin/bash
# 获取当前正在运行的容器列表
containers=$(docker ps -aq)
 
if [ ! "$containers" ]; then
    echo "没有任何容器需要停止！"
else
    # 循环遍历每个容器并启动它们
    for container in $containers; do
        docker stop $container
    done
fi
