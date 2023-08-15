#!/bin/bash

# 备份当前的 APT 源列表
backup_file="/etc/apt/sources.list.backup"
sudo cp /etc/apt/sources.list "$backup_file"

# 获取系统版本
ubuntu_version=$(lsb_release -rs | cut -d. -f1)

if [ "${ubuntu_version}" -ne 20 ] && [ "${ubuntu_version}" -ne 22 ]; then
    echo "此脚本适用于 Ubuntu 20.04 和 22.04，请确认您的系统版本。"
    exit 1
fi

# 下载并配置 CUDA 官方源
if [ "${ubuntu_version}" -eq 20 ]; then
    # 替换 APT 源为清华源
    sudo tee /etc/apt/sources.list << EOF
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal universe
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates universe
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security universe
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security multiverse
EOF

    echo "已将 APT 源修改为清华源。"

elif [ "${ubuntu_version}" -eq 22 ]; then
        
    # 替换 APT 源为清华源
    sudo tee /etc/apt/sources.list << EOF
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse

deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse

deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse

deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse

deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
EOF

    echo "已将 APT 源修改为清华源。"

fi
