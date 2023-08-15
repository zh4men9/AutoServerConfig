#!/bin/bash

# 卸载 CUDA 驱动
echo "卸载 CUDA 驱动..."
sudo apt-get --purge remove '^nvidia-.*' -y

# 卸载 CUDA 软件包
echo "卸载 CUDA 软件包..."
sudo apt-get --purge remove '^cuda-.*' -y

# 移除残留文件和配置
echo "移除残留文件和配置..."
sudo apt-get autoremove -y
sudo apt-get autoclean -y

# 移除 Nvidia 驱动 PPA (如果有)
echo "移除 Nvidia 驱动 PPA (如果有)..."
sudo add-apt-repository --remove ppa:graphics-drivers/ppa -y

echo "CUDA 和 Nvidia 驱动已卸载。"

# 如果需要，您还可以重启系统以确保卸载生效
# sudo reboot
