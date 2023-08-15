#!/bin/bash

sudo rm -rf ./fastgithub_linux-x64

unzip fastgithub_linux-x64.zip

sudo ./fastgithub_linux-x64/fastgithub start

proxy_url="http://127.0.0.1:38457"

# 设置代理
gsettings set org.gnome.system.proxy mode 'auto'
gsettings set org.gnome.system.proxy autoconfig-url "$proxy_url"

# 打印设置信息
echo "已设置系统自动代理为: $proxy_url"

sudo rm -rf ./fastgithub_linux-x64