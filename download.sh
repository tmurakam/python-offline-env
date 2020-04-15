#!/bin/sh

./installer/create-venv.sh || exit 1

. /opt/python-env/bin/activate || exit 1

# Update pip / setuptools
pip install -U pip
pip install -U setuptools

# Download pip / setuptools
pip download pip
pip download setuptools
mv pip*.whl setuptools*.whl installer/

# Download required packages
pip download -r requirements.txt -d installer/files
