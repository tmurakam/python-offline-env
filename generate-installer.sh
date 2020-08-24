#!/bin/bash

#
# Generate installer
#

export VENV_DIR=$PWD/tmp
/bin/rm -rf $VENV_DIR

./installer/create-venv.sh "$VENV_DIR" $@ || exit 1

. $VENV_DIR/bin/activate || exit 1

PIP=pip

# cleanup
/bin/rm installer/cache/* installer/cache/.python2 >/dev/null 2>&1

if [ -e $VENV_DIR/bin/python2 ]; then
    touch installer/cache/.python2

    # It seems that the pip 20.x does not work for python 2...
    PIP_PKG="pip==19.3.1"
else
    PIP_PKG="pip"
fi

# Update pip / setuptools
$PIP install -U $PIP_PKG
$PIP install -U setuptools

# Download pip / setuptools
#$PIP download -d installer pip setuptools
$PIP download -d installer/cache --no-binary :all: $PIP_PKG setuptools

# Download required packages
#$PIP download -d installer/cache -r requirements.txt --no-binary :all:
$PIP download -d installer/cache -r requirements.txt

cp requirements.txt installer/

TARBALL=python-offline-env-installer.tar.gz
tar cvzf $TARBALL installer/

echo "==> Done, $TARBALL generated."
