#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <venv_dir>"
    exit 1
fi

VENV_DIR=$1

if [ -e $VENV_DIR/bin/activate ]; then
    echo "==> Virtual env already exists, do nothing."
    exit 0
fi

# check virtualenv
if ! command -v python3 >/dev/null 2>&1; then
    echo "==> No python3 found"
    exit 1
fi
echo "==> Use python3 and venv"
VENV="$(command -v python3) -m venv"

# create virtual env
echo "==> Create virtual env in $VENV_DIR"
mkdir $VENV_DIR >/dev/null 2>&1 || (sudo mkdir $VENV_DIR && sudo chown $(id -u):$(id -g) $VENV_DIR) || exit 1
$VENV $VENV_DIR
