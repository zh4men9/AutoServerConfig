#!/bin/bash

# 获取当前的全局 Git 用户名和电子邮件
current_user=$(git config --global user.name)
current_email=$(git config --global user.email)

# 提示用户输入新的全局 Git 用户名
echo "请输入新的全局 Git 用户名，并按 Enter："
read new_user

# 提示用户输入新的全局 Git 电子邮件
echo "请输入新的全局 Git 电子邮件，并按 Enter："
read new_email

# 备份当前的 Git 配置
backup_file="$HOME/git_config_backup_$(date +'%Y%m%d%H%M%S').txt"
git config --global --list > "$backup_file"

# 设置新的全局 Git 用户名和电子邮件
git config --global user.name "$new_user"
git config --global user.email "$new_email"

echo "已将全局 Git 用户名更改为: $new_user"
echo "已将全局 Git 电子邮件更改为: $new_email"
echo "更换前的配置已备份到: $backup_file"
echo "更换前的配置:"
cat "$backup_file"
echo "更换后的配置:"
git config --global --list
