#!/bin/sh

DEST=/opt/python-env

install_virtualenv() {
    echo "install virtualenv"
    if [ -e /etc/redhat-release ]; then
        sudo yum install python-virtualenv
    else
        echo "You need install virtualenv"
        exit 1
    fi
}

if [ ! "$1" == "-2" ] && type /usr/bin/python3 >/dev/null 2>&1; then
    echo "Use /usr/bin/python3 and venv"
    VENV="/usr/bin/python3 -m venv"
elif [ -e /usr/bin/virtualenv ]; then
    echo "Use /usr/bin/virtualenv"
    VENV=/usr/bin/virtualenv
elif [ -e /etc/redhat-release ]; then
    sudo yum install python-virtualenv || exit 1
    VENV=/usr/bin/virtualenv
fi

# create virtual env
if [ ! -e $DEST/bin/activate ]; then
    echo "Create virtual env in $DEST"
    sudo mkdir $DEST
    sudo chown $(id -u):$(id -g) $DEST
    $VENV $DEST
fi
