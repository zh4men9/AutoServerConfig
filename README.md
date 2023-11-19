# AutoServerConfig
配置服务器的脚本

# 使用
目前只支持Ubuntu 20.04和Ubuntu22.04

可以执行run.sh一键执行全部shell，或者根据自己选择执行脚本。脚本的名字具有自解释性。

# 各个文件含义
├── 0-change_host_name.sh # 更改主机名字
├── 10-install_git_lfs.sh # 安装git lfs
├── 11-install_docker.sh # 安装docker
├── 12-install_java.sh # 安装java
├── 13-change_maven_source.sh # 更改maven源
├── 1-add_ssh_key.sh # 添加ssh-key
├── 2-change_global_git_infomation.sh # 更改git配置
├── 3-modify_apt_source.sh # 更换apt源
├── 4-install_miniconda.sh # 安装miniconda
├── 5-install_cuda11.7.sh # 安装cuda11.7
├── 5-install_cuda12.2.sh # 安装cuda12.2
├── 6-change_pip_source.sh # 更改pip源
├── 7-set_alias.sh # 设置一些常用别称
├── 8-accelerate_git.sh # 加速git，这个可以不需要，用代理就行
├── 9-install_fastgithub.sh # 安装fastgithub，这个可以不需要
├── README.md
├── run.sh # 可以修改shell文件内容，一键执行。注意，根据自己选择设置需要执行的脚步，最好是按照需要手动执行某个shell脚本
└── uninstall_cuda.sh # 卸载cuda


# 参考

https://blog.csdn.net/qq_32614873/article/details/129183800
https://blog.csdn.net/qq_32614873/article/details/125191677?spm=1001.2014.3001.5502
https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local
https://zhuanlan.zhihu.com/p/432414619
https://zhuanlan.zhihu.com/p/35176928
https://blog.csdn.net/qq_46202265/article/details/128764132