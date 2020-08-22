#!/bin/bash

VENV_DIR=${VENV_DIR:-/opt/python-env}

install_virtualenv() {
    if [ -e /etc/redhat-release ]; then
        echo "Trying to install virtualenv"
        sudo yum install python-virtualenv
    else
        echo "You need install virtualenv"
        exit 1
    fi
}

if [ -e $VENV_DIR/bin/activate ]; then
    echo "Virtual env already exists, do nothing."
    exit 0
fi

# check virtualenv
if [ "$1" == "-3" ]; then
    if ! command -v python3 >/dev/null 2>&1; then
        echo "No python3 found"
        exit 1
    fi
    echo "Use python3 and venv"
    VENV="$(command -v python3) -m venv"
elif command -v virtualenv >/dev/null 2>&1; then
    echo "Use virtualenv"
    VENV=$(command -v virtualenv)
elif command -v python3 >/dev/null 2>&1; then
    echo "Use python3 and venv"
    VENV="$(command -v python3) -m venv"
else
    install_virtualenv
    VENV=/usr/bin/virtualenv
fi


# create virtual env
echo "Create virtual env in $VENV_DIR"
mkdir $VENV_DIR >/dev/null 2>&1 || (sudo mkdir $VENV_DIR && sudo chown $(id -u):$(id -g) $VENV_DIR) || exit 1
$VENV $VENV_DIR
