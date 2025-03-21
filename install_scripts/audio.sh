#! /bin/bash

# Official documentation for PipeWire
# https://wiki.archlinux.org/title/PipeWire

# All the packages below should be installed per default if PipeWire was choosen in the Linux install script

# Installs the PipeWire main deamon
# pacman -Sy pipewire

# Installs the Session Manager for PipeWire
# pacman -Sy wireplumber

# Installs the Advanced Linux Sound Architecture (ALSA), essentially an API for sound card drivers
# pacman -Sy pipewire-alsa

# Allows PipeWire interoperability with Bluetooth devices
# pacman -Sy pipewire-audio

# Allows PipeWire interoperability with the PulseAudio audio server
# pacman -Sy pipewire-pulse

# Allows PipeWire interoperability with JACK
# pacman -Sy pipewire-jack
