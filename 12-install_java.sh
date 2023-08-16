#!/bin/bash

# 更新软件包列表
sudo apt-get update

# 安装 OpenJDK 11
sudo apt-get install -y openjdk-11-jdk

# 配置 Java 环境变量
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
echo 'export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' >> ~/.bashrc

# 使配置的环境变量生效
source ~/.bashrc

# 验证安装
java -version

echo "Java 安装和环境变量配置完成。"
