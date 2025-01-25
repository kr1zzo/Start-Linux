#!/bin/bash

#variables

GITHUB_USERNAME="kr1zzo"

GITHUB_EMAIL="krizman.enio@outlook.com"

MAKE_SSH=false

ROS2_VERSION="ros-iron"

sudo apt-get install python3

#ROS2 Iron Irwini

locale  # check for UTF-8

sudo apt update && sudo apt install locales 
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

sudo apt install software-properties-common -y
sudo add-apt-repository universe -y

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg -y

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update && sudo apt install ros-dev-tools -y

sudo apt update

sudo apt upgrade

sudo apt install $ROS2_VERSION-desktop -y

sudo apt install $ROS2_VERSION-ros-base -y

echo -n "source /opt/ros/iron/setup.bash" >> .bashrc

#vscode

sudo snap install --classic code -y

#chrome

sudo apt update

sudo apt upgrade

sudo apt install wget 

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb 

sudo apt-get install -f

#github

sudo apt install git

git config --global user.name $GITHUB_USERNAME

git config --global user.email $GITHUB_EMAIL

if ["$MAKE_SSH"=true]; then

cd ~/.ssh

rm *

echo new_key | ssh-keygen -t ed25519 -C $GITHUB_EMAIL

ssh-keyscan github.com >> ~/.ssh/known_hosts

gedit ./new_key.pub

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/new_key

fi

#https://medium.com/@julkhair/quickly-create-or-set-up-github-ssh-in-ubuntu-23-04-example-ad47ca1dbfa

#test github connection

ssh -T git@github.com

#overleaf

sudo snap install overleaf

sudo apt update

sudo apt upgrade

sudo apt install gthumb
