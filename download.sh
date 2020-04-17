#!/bin/sh

./installer/create-venv.sh $@ || exit 1

. /opt/python-env/bin/activate || exit 1

# cleanup
/bin/rm installer/pip/* installer/files/*

# Update pip / setuptools
pip install -U pip
pip install -U setuptools

# Download pip / setuptools
#pip download -d installer pip setuptools
pip download -d installer/pip --no-binary :all: pip setuptools

# Download required packages
pip download -d installer/files -r requirements.txt --no-binary :all: 

