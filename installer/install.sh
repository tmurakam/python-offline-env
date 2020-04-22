#!/bin/sh

export VENV_DIR=${VENV_DIR:-/opt/python-env}

# create venv
./create-venv.sh $@ || exit 1

# activate venv
. $VENV_DIR/bin/activate || exit 1

echo "python = $(which python)"
echo "pip = $(which pip)"

INSTALL="pip install -U --no-index --disable-pip-version-check --find-links=./cache" # -v

# install pip
#python $PIP_WHL/pip install -U pip*.whl
$INSTALL pip

# install setuptools
$INSTALL setuptools

# install packages
$INSTALL -r ./requirements.txt -v
