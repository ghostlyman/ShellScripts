#!/usr/bin/env bash
read -p 'https://www.jetbrains.com/pycharm/download/#section=linux'
VERSION="2016.2"

if [[ $EUID -ne 0 ]]; then
    echo "Please run as root priviledge"
    exit 1
fi

# Install Java
yum -y install java-1.8.0-openjdk-headless.x86_64 wget

# Download PyCharm
if [ ! -f /tmp/pycharm.tar.gz ]; then
    wget -O /tmp/pycharm.tar.gz "https://download.jetbrains.com/python/pycharm-community-$VERSION.tar.gz"
fi

# Decompress PyCharm
tar -xf /tmp/pycharm.tar.gz -C /opt

# Get rid of existing symlink that points to new obsolete version
if [ -f /usr/bin/pycharm ]; then
    rm /usr/bin/pycharm
fi

ln -s "/opt/pycharm-community-$VERSION/bin/pycharm.sh" /usr/bin/pycharm
