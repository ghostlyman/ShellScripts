#!/usr/bin/env bash

# This Scripts is used for Shadowsocks-libev installation on CentOS 7 Platform
#
# Reference to -> https://github.com/teddysun/shadowsocks_install/blob/master/shadowsocks-libev.sh



# Define PATH
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin

# Only root privilege can run this script
root_priv(){
if [[ $EUID -ne 0 ]]; then
    echo "Error: Please make sure you are running as root privilege."
    exit 1
fi
}


# Disable SELinux
disable_selinux(){
if [ -s /etc/selinux/config ] && grep 'SELINUX=enforcing' /etc/selinux/config; then
    sed -i 's/SELINUX=enforcing/SELINUX=disable/g' /etc/selinux/config
    setenforce 0
fi
}

# Get local IP address
get_ip(){
    local IP=$(ip addr | egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | egrep -v '^192\.168|^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[0-2]\.|^10\.|^127\.|^224\.|^255\.|^0\.'| head -n 1)
    
}