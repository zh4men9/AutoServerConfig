#!/bin/bash

# 获取系统版本
ubuntu_version=$(lsb_release -rs | cut -d. -f1)

if [ "${ubuntu_version}" -ne 20 ] && [ "${ubuntu_version}" -ne 22 ]; then
    echo "此脚本适用于 Ubuntu 20.04 和 22.04，请确认您的系统版本。"
    exit 1
fi

# 下载并配置 CUDA 官方源
if [ "${ubuntu_version}" -eq 20 ]; then
    cuda_repo="https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64"
elif [ "${ubuntu_version}" -eq 22 ]; then
    cuda_repo="https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64"
fi

if [ ! -f "cuda-ubuntu${ubuntu_version}04.pin" ]; then
    echo "下载并配置 CUDA 官方源..."
    wget "$cuda_repo/cuda-ubuntu${ubuntu_version}04.pin"
    sudo mv "cuda-ubuntu${ubuntu_version}04.pin" /etc/apt/preferences.d/cuda-repository-pin-600
fi

# 下载 CUDA 安装包
cuda_package="cuda-repo-ubuntu${ubuntu_version}04-11-7-local_11.7.0-515.43.04-1_amd64.deb"
if [ ! -f "$cuda_package" ]; then
    echo "下载 CUDA 安装包..."
    wget "https://developer.download.nvidia.com/compute/cuda/11.7.0/local_installers/$cuda_package"
fi

# 安装 CUDA 安装包
echo "安装 CUDA 安装包..."
sudo dpkg -i "$cuda_package"

# 复制密钥到 keyrings 目录
echo "复制密钥到 keyrings 目录..."
sudo cp /var/cuda-repo-ubuntu${ubuntu_version}04-11-7-local/cuda-*-keyring.gpg /usr/share/keyrings/

# 更新软件源
echo "更新软件源..."
sudo apt-get update

# # 安装cuda-drivers-535
# 安装驱动的时候可能需要手动安装
echo "安装cuda-drivers-535..."
# sudo apt install ubuntu-drivers-common -y
# ubuntu-drivers devices
# sudo apt install nvidia-driver-535 -y
# sudo apt install -y nvidia-utils-535-server
# sudo apt install libnvidia-compute-535-server
# sudo ubuntu-drivers autoinstall

# 安装 CUDA
echo "安装 CUDA..."
sudo apt-get -y install cuda
sudo apt -y install nvidia-cuda-toolkit

# 设置环境变量
echo "设置环境变量..."
echo "export PATH=/usr/local/cuda-11.7/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.7/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc
source ~/.bashrc

echo "CUDA 环境变量设置完成。"

sudo apt-get install dkms
sudo dkms install -m nvidia -v 515.43.04

# 验证安装
echo "验证 CUDA 安装..."
nvcc --version
nvidia-smi

echo "CUDA 安装和验证完成。请重新启动终端以使环境生效。"
