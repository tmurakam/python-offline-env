#!/bin/sh

./create-venv.sh $@ || exit 1

. /opt/python-env/bin/activate || exit 1


echo "python = $(which python)"
echo "pip = $(which pip)"

# install pip
#python $PIP_WHL/pip install -U pip*.whl
pip install -U pip*.whl

# install setuptools
pip install -U setuptools*.whl

# install packages
pip install -U files/*.whl files/*.tar.gz
