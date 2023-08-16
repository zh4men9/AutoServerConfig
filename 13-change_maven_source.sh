#!/bin/bash

# 备份原有的 settings.xml 文件
mv ~/.m2/settings.xml ~/.m2/settings.xml.bak

# 创建新的 settings.xml 文件
cat > ~/.m2/settings.xml <<EOL
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">
    <mirrors>
        <mirror>
            <id>aliyun</id>
            <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
            <mirrorOf>central</mirrorOf>
        </mirror>
    </mirrors>
</settings>
EOL

echo "Maven 镜像已设置为阿里云镜像。"
