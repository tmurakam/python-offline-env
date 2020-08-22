#!/bin/sh

export VENV_DIR=${VENV_DIR:-/opt/python-env}

# create venv
if [ -e ./cache/.python2 ]; then
    ./create-venv.sh "$VENV_DIR" -2 || exit 1
else
    ./create-venv.sh "$VENV_DIR" || exit 1
fi

# activate venv
. $VENV_DIR/bin/activate || exit 1

echo "python = $(command -v python)"
echo "pip = $(command -v pip)"

INSTALL="pip install -U --no-index --disable-pip-version-check --find-links=./cache" # -v

# update pip
#python $PIP_WHL/pip install -U pip*.whl
$INSTALL pip

# update setuptools
$INSTALL setuptools

# install packages
$INSTALL -r ./requirements.txt -v
