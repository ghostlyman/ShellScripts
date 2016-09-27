#!/usr/bin/env bash

# Only Root privilege can run this script
if [ $EUID -ne 0 ]; then
    echo "Error..........Please run as root privilege"
    exit 1
fi


# Install git tools
yum -y install git gcc openssl openssl-devel
yum -y groupinstall "Development tools"


# Clone pyenv to root local home directory
cd ~
git clone git://github.com/yyuu/pyenv.git .pyenv


#Provide pyenv variable environment
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc


# Install pyenv-virtualenv plugin
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv


# REload Shell instance.
exec $SHELL

