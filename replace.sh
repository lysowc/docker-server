#!/bin/bash
# 读取配置相关的路径
while true; do
    echo "请输入要替换的用户名(输入错误直接回车，后续有确认 )："
    echo "--------------------------------------------"
    read user

    if [ -z "$user" ]; then
	echo "无效的输入。"
        continue
    else
        echo "您输入的用户是：$user"
        read -p "确认用户正确吗？[y/n] " choice
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
echo "您的用户是[ $user ]"
echo "--------------------------------------------"
find ./ -type f ! -path "./.git/*" -exec sed -i "s/sora/$user/g" {} +
