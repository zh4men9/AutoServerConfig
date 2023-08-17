#!/bin/bash

rm -rf ./fastgithub_linux-x64

# wget https://github.com/dotnetcore/FastGithub/releases/download/2.1.4/fastgithub_linux-x64.zip
unzip fastgithub_linux-x64.zip

chmod +x ./fastgithub_linux-x64/fastgithub
nohup ./fastgithub_linux-x64/fastgithub > fastgithub.log &

proxy_url="http://127.0.0.1:38457"

# 添加代理环境变量到 /etc/environment 文件
echo "http_proxy=$proxy_url" | sudo tee -a /etc/environment
echo "https_proxy=$proxy_url" | sudo tee -a /etc/environment

# 设置 Git 代理
git config --global http.proxy $proxy_url
git config --global https.proxy $proxy_url

# 打印设置信息
echo "已设置代理为: $proxy_url"

rm -rf ./fastgithub_linux-x64
