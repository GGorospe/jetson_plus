#!/bin/bash

# The first line "#!/bin/bash" is called the "shebang" and is an interpreter directive, that tells the machine to execute the following file using the Bash shell.

# Title: NMAI_Nano_Setup_Two.sh

# This is a setup script for jetson nano 4gb systems intended to be used as a part of the New Mexico AI Challenge. This script adds to Nvidia's latest version of jetpack.

# Many of the programs here are added to reproduce a jetbot like environment.
# This script borrows from the Nvidia-ai-iot/jetbot repository on github.
# "Create SD Card Image from Scratch"
# https://github.com/NVIDIA-AI-IOT/jetbot/wiki/Create-SD-Card-Image-From-Scratch

# Components:
# 1. Installing Tensorflow (2.5.0)

# Intalling Components >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Installing TensorFlow, version 2.5.0 (Instructions from Nvidia)
sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev libjpeg8-dev liblapack-dev libblas-dev gfortran
sudo pip3 install -v protobuf==3.9.2.
sudo pip3 install -U --no-deps keras_preprocessing==1.1.2 keras_applications==1.0.8 gast==0.4.0  pybind11 pkgconfig packaging
sudo env H5PY_SETUP_REQUIRES=0 pip3 install -U h5py==3.1.0 #Tensorflow wheel seems to uninstall this
sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v46 tensorflow==2.5.0+nv21.08
# Problems: protobuf can occasionally cause issues, so I've explicitly called out for installation of v 3.9.2
