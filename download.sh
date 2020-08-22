#!/bin/bash

export VENV_DIR=$PWD/tmp
/bin/rm -rf $VENV_DIR

./installer/create-venv.sh "$VENV_DIR" $@ || exit 1

. $VENV_DIR/bin/activate || exit 1

PIP=pip

# cleanup
/bin/rm installer/cache/* installer/cache/.python2 >/dev/null 2>&1

if [ -e $VENV_DIR/bin/python2 ]; then
    # It seems that the latest pip does not work for python 2...
    echo "Do not upgrade pip / setuptools for python 2"
    touch installer/cache/.python2
else
    # Update pip / setuptools
    $PIP install -U pip
    $PIP install -U setuptools

    # Download pip / setuptools
    #$PIP download -d installer pip setuptools
    $PIP download -d installer/cache --no-binary :all: pip setuptools
fi

# Download required packages
#$PIP download -d installer/cache -r requirements.txt --no-binary :all:
$PIP download -d installer/cache -r requirements.txt

cp requirements.txt installer/
