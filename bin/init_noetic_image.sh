#/bin/bash

set -e

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

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update --assume-yes
sudo apt-get install neovim --assume-yes

sudo apt-get install tmux nano curl python3-pip --assume-yes

# ROS1 Noetic

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt-get update --assume-yes
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
sudo apt-get install ros-noetic-desktop-full --assume-yes
sudo apt-get install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential --assume-yes

sudo apt-get install python-rosdep
sudo rosdep init
rosdep update

echo "Installed ROS1 Noetic Environment"
