#!/bin/bash

# 备份原有的 pip 配置文件
if [ -f "$HOME/.pip/pip.conf" ]; then
    mv "$HOME/.pip/pip.conf" "$HOME/.pip/pip.conf.backup"
fi

# 创建新的 pip 配置文件
mkdir -p "$HOME/.pip"
cat << EOF > "$HOME/.pip/pip.conf"
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
EOF

echo "已将 pip 源切换为清华源。"
