#!/bin/bash

sudo pacman -S libva-nvidia-driver xdg-desktop-portal-hyprland polkit-kde-agent qt5-wayland qt6-wayland wofi waybar pipewire wireplumber grim cliphist


# Add the following to the options list in relevant boot config file in /boot/loader/entries/ 
# nvidia_drm.modeset=1 nvidia.NV_regPreserveVideoMemoryAllocations=1

# After that add the following to the /etc/mkinitcpio.conf file
# MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
