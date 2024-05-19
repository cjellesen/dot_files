#!/bin/bash
sudo pacman -S go

wget -O dotnet-install.sh https://dot.net/v1/dotnet-install.sh
chmod +x ./dotnet-install.sh
sudo mkdir -p /usr/share/dotnet
sudo ./dotnet-install.sh --install-dir /usr/share/dotnet --channel 8.0
rm ./dotnet-install.sh

# Add the 2 lines below to either the .bashrc or the .bash_profile depending on preference
# export DOTNET_ROOT=$HOME/.dotnet
# export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

