#!/bin/bash

# 定义 Miniconda 版本和安装路径
miniconda_version="latest"  # 或指定特定版本，如 "4.10.3"
install_path="$HOME/miniconda"
echo "install_path: $install_path"

# 检查是否已安装 Miniconda
if [ -d "$install_path" ]; then
    echo "Miniconda 已经安装在 $install_path。跳过安装阶段。"
else
    # 下载 Miniconda 安装脚本
    sudo wget "https://repo.anaconda.com/miniconda/Miniconda3-$miniconda_version-Linux-x86_64.sh" -O miniconda_installer.sh

    # 执行安装脚本
    sudo bash miniconda_installer.sh -b -p "$install_path"

    # 添加 Miniconda 到 PATH
    echo "export PATH=\"$install_path/bin:\$PATH\"" >> "$HOME/.bashrc"
    source "$HOME/.bashrc"

    # 清理安装文件
    rm miniconda_installer.sh

    echo "Miniconda 安装完成。请重新启动终端或运行 'source ~/.bashrc' 以使更改生效。"
fi

# 添加 Conda 到 PATH
export PATH="$install_path/bin:$PATH"

# 配置 Conda 清华源
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes

# 打印 Conda 源配置信息
conda config --show-sources

# 修改 .condarc 文件的内容
cat << EOF > "$HOME/.condarc"
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch-lts: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
EOF

echo ".condarc 文件已更新为清华源配置。"

# 打印 Conda 源配置信息
conda config --show-sources

echo "已将 Conda 源切换为清华源。"
