#!/usr/bin/env bash
#
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# Only Root privilege can run this script
root_permission() {
    if [ $EUID -ne 0 ]; then
        echo "Error..........Please run as root privilege" 1>&2
        exit 1
    fi
}

#Words colors
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'


detecting_dependence() {
    local command=$1
    local depend=`echo "${command}" | awk '{print $4}'`
    ${command}
    if [ $? != 0 ]; then
        echo -e '${red}Error:${plain} Failed to install ${red}${depend}${plain}'
        echo "Error, please confirm it."
        exit 1
    fi
}


install_dependencies() {
    yum_depends=(git gcc openssl openssl-devel wget links elinks)
    for depend in ${yum_depends[@]}; do
        detecting_dependence "yum -y install ${depend}"
    done
}

group_install_dependencies() {
    yum_depends=(Development Tools)
    for depend in ${yum_depends}; do
        detecting_dependence "yum -y groupinstall ${depend}"
    done
}

# Clone pyenv to root local home directory
clone_files() {
    cd ~
    git clone git://github.com/yyuu/pyenv.git .pyenv
}


#Provide pyenv variable environment
export_env() {
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    eval "$(pyenv virtualenv-init -)" >> ~/.bashrc
}


# Install pyenv-virtualenv plugin
install_virtualenv() {
    git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
}


root_permission
install_dependencies
group_install_dependencies
clone_files
export_env
install_virtualenv

# REload Shell instance.
exec $SHELL

