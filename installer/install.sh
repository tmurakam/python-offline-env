#!/bin/sh

DEST=/opt/python-env

install_virtualenv() {
    echo "install virtualenv"
    # TODO:
}

if [ python3 ]; then
    echo "Use python3"
    VENV="python3 -m venv"
else
    echo "Use python2"
    if [ virtualenv ]; then
        VENV=virtualenv
    else
        install_virtualenv
    fi
fi


# create virtual env and activate
if [ ! -e $DEST/bin/activate ]; then
    sudo mkdir $DEST
    sudo chown $(id -u):$(id -g) $DEST
    $VENV $DEST
fi
. $DEST/bin/activate
