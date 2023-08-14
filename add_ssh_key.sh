#!/bin/bash

# 提示用户输入 SSH 公钥
echo "请输入您的 SSH 公钥，并按 Enter："
read ssh_key

# 获取当前登录的用户名
current_user=$(whoami)

# 将 SSH 公钥添加到授权文件
echo "$ssh_key" >> /home/$current_user/.ssh/authorized_keys

echo "SSH 公钥已成功添加到授权文件。"
