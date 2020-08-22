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
if [ "$1" == "-2" ]; then
    # force use virtualenv and python2
    if command -v virtualenv >/dev/null 2>&1; then
        echo "Use virtualenv"
        VENV=$(command -v virtualenv)
    else
        install_virtualenv
        VENV=$(command -v virtualenv)
    fi
elif ! command -v python3 >/dev/null 2>&1; then
        echo "No python3 found"
        exit 1
else
    echo "Use python3 and venv"
    VENV="$(command -v python3) -m venv"
fi

# create virtual env
echo "Create virtual env in $VENV_DIR"
mkdir $VENV_DIR >/dev/null 2>&1 || (sudo mkdir $VENV_DIR && sudo chown $(id -u):$(id -g) $VENV_DIR) || exit 1
$VENV $VENV_DIR
