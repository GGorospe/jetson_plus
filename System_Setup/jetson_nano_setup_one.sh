#!/bin/bash

# The first line "#!/bin/bash" is called the "shebang" and is an interpreter directive, that tells the machine to execute the following file using the Bash shell.

# Title: jetson_nano_setup_one.sh

# This is a setup script for jetson nano 4gb systems. This script adds to Nvidia's latest version of jetpack.

# Many of the programs here are added to reproduce a jetbot like environment.
# This script borrows from the Nvidia-ai-iot/jetbot repository on github.
# "Create SD Card Image from Scratch"
# https://github.com/NVIDIA-AI-IOT/jetbot/wiki/Create-SD-Card-Image-From-Scratch

# Components:
# 1. I2C Permissions and command line tools
# 2. Python and python additions

# Intalling Components >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# enable i2c permissions
sudo usermod -aG i2c $USER

# Command line tools and compilation tools
sudo apt install curl
sudo pip3 install jetson-stats

# Pip and python dependencies
sudo apt-get -y update
sudo apt install -y python3-pip python3-pil # Preffered Installer Program (PIP) and Python image processing (PIL)
pip3 install --upgrade pip
sudo pip3 install -U setuptools==58.3.0 # For managing and installing python packages
sudo pip3 install traitlets
sudo pip3 install ipywidgets
sudo pip3 install sparkfun-qwiic
sudo pip3 install Cython # C language extensions for python
sudo pip3 install --upgrade numpy  # At start Numpy = 1.13.3, upgraded to numpy 1.19.5 
sudo pip3 install -U testresources mock future
# Already installed at this point: wheel, cmake, zip,
# Not installed, with no plans to install: pillow
