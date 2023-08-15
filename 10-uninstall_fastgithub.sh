#!/bin/bash

sudo rm -rf ./fastgithub_linux-x64

unzip fastgithub_linux-x64.zip

sudo ./fastgithub_linux-x64/fastgithub stop

# 取消代理
git config --global --unset http.proxy
git config --global --unset https.proxy