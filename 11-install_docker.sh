#!/bin/bash

# 安装 Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
sudo systemctl start docker
sudo systemctl enable docker

# 安装 Docker Compose
sudo wget -O /usr/local/bin/docker-compose https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)

# 添加执行权限
sudo chmod +x /usr/local/bin/docker-compose

echo "Docker 和 Docker Compose 安装完成。请重新启动终端以使更改生效。"

# 输出 Docker 和 Docker Compose 版本信息
docker --version
docker-compose --version

echo "Docker 和 Docker Compose 安装完成。"
