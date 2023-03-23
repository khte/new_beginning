#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

#Basics
sudo apt install -y ffmpeg coreutils nano build-essential vlc unzip wget gnome-tweaks solaar

#Guake
sudo apt install -y guake

#Allow fingerprint as sudo
sudo pam-auth-update

#Git
sudo apt install -y git 

#Add user to dialout
sudo usermod -a -G dialout $USER

#Curl
sudo snap install -y curl

#zsh
sudo apt install -y zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#simlink configs
mv ~/.bashrc ~/.bashrc.old

#fzf
sudo apt install -y fzf

#Python3
sudo apt install -y python3 python3-dev

#source
source ~/.zshrc

#wire
wget -q https://wire-app.wire.com/linux/releases.key -O- | sudo apt-key add -
echo "deb [arch=amd64] https://wire-app.wire.com/linux/debian stable main" \
   | sudo tee /etc/apt/sources.list.d/wire-desktop.list
sudo apt-get update && sudo apt install -y wire-desktop

#VS code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt -y install code

#ros2
sudo apt install -y software-properties-common
sudo add-apt-repository universe

sudo apt update
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
sudo apt upgrade

sudo apt install -y ros-humble-desktop
sudo apt install -y ros-dev-tools

sudo apt install -y python3-colcon-common-extensions python3-vcstool

sudo apt install -y ros-humble-ros2-controllers ros-humble-ros2-control ros-humble-controller-manager 
sudo apt install -y ros-humble-xacro ros-humble-ros-core ros-humble-geometry2 ros-humble-ros2-controllers ros-humble-ros2-control ros-humble-controller-manager ros-humble-gazebo-ros-pkgs ros-humble-mavros ros-humble-mavros-msgs ros-humble-gazebo-ros2-control

#smacc dependencies
sudo apt install -y python3-colcon-common-extensions python3-vcstool python3-rosdep python3-rospkg ros-humble-tf2-geometry-msgs ros-humble-geometry-msgs

# upgrade rospkg
sudo apt install -y python3-pip
pip3 install -U rospkg 

#px4 firmware
cd $HOME/
git clone git@github.com:PX4/PX4-Autopilot.git
cd PX4-Autopilot
git checkout 