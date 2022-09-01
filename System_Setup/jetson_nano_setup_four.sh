#!/bin/bash

# The first line "#!/bin/bash" is called the "shebang" and is an interpreter directive, that tells the machine to execute the following file using the Bash shell.

# Title: NMAI_Nano_Setup_Four.sh

# This is a setup script for jetson nano 4gb systems intended to be used as a part of the New Mexico AI Challenge. This script adds to Nvidia's latest version of jetpack.

# Many of the programs here are added to reproduce a jetbot like environment.
# This script borrows from the Nvidia-ai-iot/jetbot repository on github.
# "Create SD Card Image from Scratch"
# https://github.com/NVIDIA-AI-IOT/jetbot/wiki/Create-SD-Card-Image-From-Scratch

# Components:
# 1. Jupyter, Jupyter Lab, Nodejs, NPM
# 2. Jupyter extention "Clickable Widget"

# Intalling Components >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Installing Jupyter, Jupyter Lab, and Nodejs
#sudo python3 -m pip install git+https://github.com/ipython/traitlets@main
sudo pip3 install traitlets

# Installing the Node.js LTS (v16.x): 
https://github.com/nodesource/distributions#installation-instructions
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo pip3 install jupyter jupyterlab
sudo jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter lab --generate-config
jupyter notebook password


# Installing jupyter lab extension "Clickable Widget"
git clone https://github.com/jaybdub/jupyter_clickable_image_widget
cd jupyter_clickable_image_widget
sudo pip3 install -e .
sudo jupyter labextension install js