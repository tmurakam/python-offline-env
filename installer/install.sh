#!/bin/sh

DEST=/opt/python-env

install_virtualenv() {
    echo "install virtualenv"
    # TODO:
}

if type python3 >/dev/null 2>&1; then
    echo "Use python3"
    PYTHON=python3
    VENV="python3 -m venv"
else
    echo "Use python2"
    PYTHON=python
    if type virtualenv >/dev/null 2>&1; then
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

# install pip
PIP_WHL=pip-20.0.2-py2.py3-none-any.whl
python $PIP_WHL/pip install -U $PIP_WHL

# install setuptools
pip install -U setuptools*.whl

# install packages
pip install -U files/*.whl files/*.tar.gz
