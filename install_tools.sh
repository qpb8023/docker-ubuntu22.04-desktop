#!/usr/bin/env bash

echo "修改为清华源"

apt-get update
apt-get install -y apt-transport-https  ca-certificates 

cat >/etc/apt/sources.list <<EOL
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
EOL

apt-get update

echo "时区修改"


DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime  


echo "生成zh_CN.UTF-8语言环境"
apt-get install language-pack-zh-hans  -y
locale-gen zh_CN.UTF-8

echo export LANG=zh_CN.UTF-8 >>  /etc/profile
echo export LC_ALL=zh_CN.UTF-8  >>  /etc/profile
echo export LANGUAGE=zh_CN.UTF-8  >>  /etc/profile

source /etc/profile

DEBIAN_FRONTEND="noninteractive" apt-get install ubuntu-desktop-minimal -y
apt-get install gnome-session gnome-terminal tigervnc-standalone-server -y

# echo "安装一些常用工具以便进一步安装"

apt-get install vim -y





