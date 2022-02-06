# Python offline env / installer

An offline environment/installer for Python.

It is for setting up packages (such as Ansible) in a completely offline environment.

## Requirements

You need following on both target machine and generator machine which used to generate offline installer.

* Python 3 + pip3 + venv

### For RHEL 7 / CentOS 7

Install python3:

    $ sudo yum install python3
    
### For Ubuntu

Install python3 and venv:

    $ sudo apt install python3 python3-venv        

## Generating an installer.

Add needed packages to the `requirements.txt`.

Run `generate-installer.sh` to generate the installer on the generator machine.

    $ ./generate-installer.sh

Running `generate-installer.sh` will create a temporary virtual environment that can be used to create package (pip, setuptools, and packages described in requirements.txt) are generated under the installer directory.

## Installation.

Copy and extract the `python-offline-env-installer.tar.gz` to the offline target machine, and you can run `sudo install.sh` to perform the installation.

The binaries are installed in `/opt/python-env/bin/` directory.

You can use the environment to add this directory to your PATH environment variable, or `source` the `/opt/python-bin/env/activate` script.

## Notes.

The generated installer depends on the OS (distribution) and Python version on which generate the installer.

Therefore, use the same OS/Python version of the target machine to generate the installer.
