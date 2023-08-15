#!/bin/bash

# 运行 nslookup 命令，并将输出保存到变量
nslookup_output_github=$(nslookup github.com)
nslookup_output_fastly=$(nslookup github.global.ssl.fastly.net)

# 使用 awk 提取第一个 IP 地址
ip_address=$(echo "$nslookup_output_github" | awk '/Address: / {print $2; exit}')
ip_address2=$(echo "$nslookup_output_fastly" | awk '/Address: / {print $2; exit}')

# 输出提取的 IP 地址
echo "github.com 的 IP 地址为: $ip_address"
echo "github.global.ssl.fastly.net 的第一个 IP 地址为: $ip_address2"

# 在 /etc/hosts 添加 IP 地址映射
sudo bash -c "echo '$ip_address http://github.com' >> /etc/hosts"
sudo bash -c "echo '$ip_address https://github.com' >> /etc/hosts"
sudo bash -c "echo '$ip_address2 http://github.global.ssl.fastly.net' >> /etc/hosts"
sudo bash -c "echo '$ip_address2 https://github.global.ssl.fastly.net' >> /etc/hosts"

# 重启网络服务
sudo systemctl restart systemd-networkd

echo "已添加 IP 地址映射并重启网络服务。"
