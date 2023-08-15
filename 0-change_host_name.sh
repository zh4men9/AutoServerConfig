#!/bin/bash

# 提示用户输入新的主机名
read -p "请输入新的主机名: " new_hostname

# 检查输入是否为空
if [ -z "$new_hostname" ]; then
    echo "输入的主机名为空。操作已取消。"
    exit 1
fi

# 获取当前主机名
current_hostname=$(hostname)

# 显示当前主机名并请求确认
echo "当前主机名: $current_hostname"
read -p "确认将主机名修改为 '$new_hostname' 吗？ (y/n): " confirm

if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "操作已取消。"
    exit 1
fi

# 修改主机名
sudo hostnamectl set-hostname "$new_hostname"

# 更新 /etc/hosts 文件
sudo sed -i "s/$current_hostname/$new_hostname/g" /etc/hosts

# 重启系统
echo "主机名已修改为 '$new_hostname'。系统将在5秒后重启..."
sleep 5
sudo reboot
