#!/bin/bash

sudo rm -rf ./fastgithub_linux-x64

unzip fastgithub_linux-x64.zip

sudo chmod +x ./fastgithub_linux-x64/fastgithub
sudo ./fastgithub_linux-x64/fastgithub

proxy_url="http://127.0.0.1:38457"

# 设置代理
gsettings set org.gnome.system.proxy mode auto
gsettings set org.gnome.system.proxy autoconfig-url $proxy_url

export http_proxy=http://127.0.0.1:38457
export https_proxy=http://127.0.0.1:38457

git config --global http.proxy http://127.0.0.1:38457
git config --global https.proxy http://127.0.0.1:38457

git config --global --get http.proxy
git config --global --get https.proxy

gsettings get org.gnome.system.proxy mode
gsettings get org.gnome.system.proxy autoconfig-url

# 打印设置信息
echo "已设置系统自动代理为: $proxy_url"

sudo rm -rf ./fastgithub_linux-x64