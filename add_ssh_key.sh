#!/bin/bash

# 提示用户输入 SSH 公钥
echo "请输入您的 SSH 公钥，并按 Enter："
read ssh_key

# 获取当前登录的用户名
current_user=$(whoami)

# 如果是root用户，就直接添加到 root 用户的授权文件
if [ $current_user = "root" ]; then
    echo "$ssh_key" >> /root/.ssh/authorized_keys
    echo "SSH 公钥已成功添加到授权文件。"
    exit 0
    
elif # 如果不是 root 用户，就添加到当前用户的授权文件
    # 如果当前用户的授权文件不存在，就创建一个
    if [ ! -f /home/$current_user/.ssh/authorized_keys ]; then
        mkdir -p /home/$current_user/.ssh
        touch /home/$current_user/.ssh/authorized_keys
        chmod 600 /home/$current_user/.ssh/authorized_keys
        chown $current_user:$current_user /home/$current_user/.ssh/authorized_keys
    fi
    # 将 SSH 公钥添加到授权文件
    echo "$ssh_key" >> /home/$current_user/.ssh/authorized_keys

    echo "SSH 公钥已成功添加到授权文件。"

    exit 0
fi
