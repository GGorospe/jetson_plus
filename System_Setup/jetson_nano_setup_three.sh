#!/bin/bash
# THIS FILE SHOULD BE SOURCED, example: source jetson_nano_setup_three.sh

# The first line "#!/bin/bash" is called the "shebang" and is an interpreter directive, that tells the machine to execute the following file using the Bash shell.

# Title: jetson_nano_setup_three.sh


# This is a setup script for jetson nano 4gb systems. This script adds to Nvidia's latest version of jetpack.

# Many of the programs here are added to reproduce a jetbot like environment.
# This script borrows from the Nvidia-ai-iot/jetbot repository on github.
# "Create SD Card Image from Scratch"
# https://github.com/NVIDIA-AI-IOT/jetbot/wiki/Create-SD-Card-Image-From-Scratch

# Components:
# 1. PyTorch (1.10.0) and TorchVision (0.11.1)

# Intalling Components >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Installing PyTorch, version 1.10.0 (Instructions from Nvidia)
# This install depends on the version of python used and the version of CUDA currently installed
# For the baseline, jetpack 4.6, we're using Python 3.6.9 and CUDA Version 10.2.300
# install the dependencies (if not already onboard)

sudo apt-get -y install autoconf bc build-essential g++-8 gcc-8 clang-8 lld-8 gettext-base gfortran-8 iputils-ping libbz2-dev libc++-dev libcgal-dev libffi-dev libfreetype6-dev libhdf5-dev libjpeg-dev liblzma-dev libncurses5-dev libncursesw5-dev libpng-dev libreadline-dev libssl-dev libsqlite3-dev libxml2-dev libxslt-dev locales moreutils openssl python-openssl rsync scons python3-pip libopenblas-dev;

wget --content-disposition https://nvidia.box.com/shared/static/fjtbno0vpo676a25cgvuqc1wty0fkkg6.whl

python3 -m pip install --no-cache torch-1.10.0-cp36-cp36m-linux_aarch64.whl

# TorchVision
sudo apt-get -y install libjpeg-dev zlib1g-dev libpython3-dev libavcodec-dev libavformat-dev libswscale-dev libmpi-dev

git clone --branch v0.11.1 https://github.com/pytorch/vision torchvision
cd torchvision
export BUILD_VERSION=0.x.0
python3 setup.py install --user
cd ..
