#!/usr/bin/env bash

echo "修改为清华源"

apt-get update
apt-get install -y apt-transport-https  ca-certificates 

sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
sed -i "s@http://.*security.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list

apt-get update

echo "时区修改"


DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime  


echo "生成zh_CN.UTF-8语言环境"
apt-get install language-pack-zh-hans  -y
locale-gen zh_CN.UTF-8

cat >/etc/profile
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
export LANGUAGE=zh_CN.UTF-8
EOL

source /etc/profile

DEBIAN_FRONTEND="noninteractive" apt-get install ubuntu-desktop-minimal -y
apt-get install gnome-session gnome-terminal tigervnc-standalone-server -y

# echo "安装一些常用工具以便进一步安装"

apt-get install vim -y





