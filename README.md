# Python offline env / installer

An offline environment/installer for Python.

It is for setting up packages (such as Ansible) in a completely offline environment.

## Requirements

You need one of the following.

* Python 2 + pip + virtualenv
* Python 3 + pip3 + venv

If both are present, virtualenv is used.

If you want to force to use of Python 3, specify "-3" as an argument to download.sh and install.sh.

## Generating an installer.

Add needed packages to the `requirements.txt`.

Run `download.sh` to generate the installer.
Running `download.sh` will create a temporary virtual environment that can be used to create package (pip, setuptools, and packages described in requirements.txt) are generated under the installer directory.

## Installation.

Copy the `installer` directories to the offline target machine, and you can run `install.sh` to perform the installation.

The binaries are installed in /opt/python-env/bin/ directory.

You can use the environment to add this directory to your PATH environment variable, or `source` the `/opt/python-bin/env/activate` script.

## Notes.

The generated installer depends on the OS (distribution) and Python version on which generate the installer.

Therefore, use the same OS/Python version of the target machine to generate the installer.
