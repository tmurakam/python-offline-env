#!/bin/bash

export VENV_DIR=$PWD/tmp

./installer/create-venv.sh $@ || exit 1

. $VENV_DIR/bin/activate || exit 1

if [ ! "$1" == "-2" ] && type pip3 >/dev/null 2>&1; then
    PIP=pip3
else
    PIP=pip
fi

# cleanup
/bin/rm installer/pip/* installer/files/*

# Update pip / setuptools
$PIP install -U pip
$PIP install -U setuptools

# Download pip / setuptools
#$PIP download -d installer pip setuptools
$PIP download -d installer/pip --no-binary :all: pip setuptools

# Download required packages
#$PIP download -d installer/files -r requirements.txt --no-binary :all:
$PIP download -d installer/files -r requirements.txt
