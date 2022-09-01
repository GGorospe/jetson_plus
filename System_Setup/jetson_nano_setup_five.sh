#!/bin/bash

# The first line "#!/bin/bash" is called the "shebang" and is an interpreter directive, that tells the machine to execute the following file using the Bash shell.

# Title: NMAI_Nano_Setup_Five.sh

# This is a setup script for jetson nano 4gb systems intended to be used as a part of the New Mexico AI Challenge. This script adds to Nvidia's latest version of jetpack.

# Many of the programs here are added to reproduce a jetbot like environment.
# This script borrows from the Nvidia-ai-iot/jetbot repository on github.
# "Create SD Card Image from Scratch"
# https://github.com/NVIDIA-AI-IOT/jetbot/wiki/Create-SD-Card-Image-From-Scratch

# Components:
# 1. Installing Jetbot Software
# 2. Starting Jetbot Services
# 3. Making the swapfile to expand available memory


# Intalling Components >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Installing Jetbot Software
sudo apt install python3-smbus
git clone https://github.com/NVIDIA-AI-IOT/jetbot
cd jetbot
sudo python3 setup.py install

# Installing Jetbot Services
cd jetbot/utils
python3 create_stats_service.py
sudo mv jetbot_stats.service /etc/systemd/system/jetbot_stats.service
sudo systemctl enable jetbot_stats
sudo systemctl start jetbot_stats
python3 create_jupyter_service.py
sudo mv jetbot_jupyter.service /etc/systemd/system/jetbot_jupyter.service
sudo systemctl enable jetbot_jupyter
sudo systemctl start jetbot_jupyter

# Making the swapfile
sudo fallocate -l 4G /var/swapfile
sudo chmod 600 /var/swapfile
sudo mkswap /var/swapfile
sudo swapon /var/swapfile
sudo bash -c 'echo "/var/swapfile swap swap defaults 0 0" >> /etc/fstab'
