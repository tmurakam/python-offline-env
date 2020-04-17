#!/bin/sh

export VENV_DIR=${VENV_DIR:-/opt/python-env}

# create venv
./create-venv.sh $@ || exit 1

# activate venv
. $VENV_DIR/bin/activate || exit 1

echo "python = $(which python)"
echo "pip = $(which pip)"

INSTALL="pip install -U --disable-pip-version-check --find-links ./files -vvv"

# install pip
#python $PIP_WHL/pip install -U pip*.whl
#$INSTALL pip*.whl
$INSTALL pip/pip*

# install setuptools
#pip install -U setuptools*.whl
$INSTALL pip/setuptools*

# install packages
$INSTALL files/*.tar.gz files/*.whl
