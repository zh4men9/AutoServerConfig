#!/bin/bash

# 添加 alias 到 shell 配置文件
echo "alias js='jobs -l'" >> "$HOME/.bashrc"
echo "alias ns='nvidia-smi'" >> "$HOME/.bashrc"

echo "Alias 添加完成，请重新启动终端以使更改生效。"
