#!/bin/sh

export VENV_DIR=${VENV_DIR:-/opt/python-env}

# create venv
./create-venv.sh $@ || exit 1

# activate venv
. $VENV_DIR/bin/activate || exit 1

echo "python = $(which python)"
echo "pip = $(which pip)"

# install pip
#python $PIP_WHL/pip install -U pip*.whl
#pip install -U pip*.whl
pip install -U pip/pip*

# install setuptools
#pip install -U setuptools*.whl
pip install -U pip/setuptools*

# install packages
pip install -U files/*.tar.gz

