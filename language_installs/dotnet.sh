#!/bin/bash

wget -O dotnet-install.sh https://dot.net/v1/dotnet-install.sh
chmod +x ./dotnet-install.sh
sudo mkdir -p $HOME/.dotnet
sudo ./dotnet-install.sh --install-dir $HOME/.dotnet --channel 8.0
sudo ./dotnet-install.sh --install-dir $HOME/.dotnet --channel 3.1
rm ./dotnet-install.sh

# Add the 2 lines below to either the .bashrc or the .bash_profile depending on preference
# export DOTNET_ROOT=$HOME/.dotnet
# export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

# When installing the Microsoft Credential provider add the following (depending on the location)
# of your Nuget directory
# export NUGET_PLUGIN_PATHS="$HOME/.nuget/plugins/netcore/CredentialProvider.Microsoft/CredentialProvider.Microsoft.dll"
