#!/bin/bash

rm -rf $HOME/.config/hypr
cp -r ./config/hypr $HOME/.config

rm -rf $HOME/.config/nvim
cp -r ./config/nvim $HOME/.config

rm -rf $HOME/.config/kitty
cp -r ./config/kitty $HOME/.config

rm -rf $HOME/.config/waybar
cp -r ./config/waybar $HOME/.config

rm -rf $HOME/.config/wofi
cp -r ./config/wofi $HOME/.config

rm -rf $HOME/.config/btop
cp -r ./config/btop $HOME/.config

rm -rf $HOME/.config/htop
cp -r ./config/htop $HOME/.config/
