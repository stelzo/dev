#/bin/bash

set -e

export TERM=xterm-256color

echo "The Noetic Container Setup is minimal because many packages don't support Ubuntu 18.04."
echo "Use bash instead of zsh for using this container."

sudo apt-get install lsb-release --assume-yes

if [ "$(lsb_release -rs)" != "20.04" ]; then
    echo "This script is for Ubuntu 20.04"
    exit 1
fi

sudo apt-get update --assume-yes && sudo apt-get install locales --assume-yes
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
#echo "export LANG=en_US.UTF-8" >> ~/.bashrc
#echo "export LANG=en_US.UTF-8" >> ~/.zshrc

export LANG=en_US.UTF-8

echo "######"
echo "Check if your .bashrc has 'export LANG=en_US.UTF-8' and add it if it does not exist."
read -p "Press Enter when done..." tmp

# Zsh and tools
sudo apt-get install software-properties-common --assume-yes

sudo apt-get install nano curl python3-pip --assume-yes

# ROS1 Noetic

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt-get update --assume-yes
sudo apt-get install ros-noetic-desktop --assume-yes
# if the last command failed with xorg stuff, apt remove all the xorg stuff

sudo apt-get install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential --assume-yes

sudo apt-get install python3-rosdep
sudo rosdep init
rosdep update

echo "Installed ROS1 Noetic Environment"
