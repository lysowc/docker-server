#!/bin/bash
# 获取当前正在运行的容器列表
containers=$(docker images -aq)
 
if [ ! "$containers" ]; then
    echo "没有任何容器需要删除！"
else
    # 循环遍历每个容器并启动它们
    for container in $containers; do
        docker rmi $container
    done
fi
