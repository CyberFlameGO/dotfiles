#!/usr/bin/env bash

set -e

# Set git config options
git config --global user.name "CyberFlame"
git config --global user.email "cyberflameu@gmail.com"
# git config --global commit.gpgsign true
# git config --global tag.gpgsign true
git config --global pull.rebase false
git config --global init.defaultBranch main

# Install stuff
sudo apt update

sudo touch /etc/zsh/zlogin && sudo mv /etc/zsh/zlogin /etc/zsh/zlogin.bak
sudo apt --yes install zsh python3-dev python3-pip python3-setuptools direnv
sudo rm /etc/zsh/zlogin && sudo mv /etc/zsh/zlogin.bak /etc/zsh/zlogin

# Install oh-my-zsh
sudo rm -rf $HOME/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configure zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Configure bash to spawn zsh
# echo "zsh || true" >> ~/.bashrc
# echo "exit" >> ~/.bashrc
