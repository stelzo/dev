#/bin/bash

set -e

sudo apt-get install lsb-release --assume-yes

if [ "$(lsb_release -rs)" != "24.04" ]; then
    echo "This script is for Ubuntu 24.04"
    exit 1
fi

sudo apt-get update --assume-yes && sudo apt-get install locales --assume-yes
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
#echo "export LANG=en_US.UTF-8" >> ~/.bashrc
#echo "export LANG=en_US.UTF-8" >> ~/.zshrc

export LANG=en_US.UTF-8

echo "######"
echo "Check if your .bashrc/.zshrc has 'export LANG=en_US.UTF-8' and add it if it does not exist."
read -p "Press Enter when done..." tmp

# Zsh and tools
sudo apt-get install software-properties-common --assume-yes

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update --assume-yes
sudo apt-get install neovim --assume-yes

sudo apt-get install zsh zsh-autosuggestions zsh-syntax-highlighting tmux nano curl python3-pip --assume-yes
chsh -s /usr/bin/zsh

# Languages
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update --assume-yes
sudo apt-get install rustup golang-go --assume-yes

# ROS2 Jazzy

sudo add-apt-repository universe -y

sudo apt-get update --assume-yes
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt-get update --assume-yes && sudo apt-get install ros-dev-tools ros-jazzy-desktop --assume-yes

# Rust ROS2 integration
cargo install cargo-binstall
pip install colcon-ros-cargo --break-system-packages
cargo binstall cargo-ament-build -y

echo "Installed ROS2 Jazzy Environment"
