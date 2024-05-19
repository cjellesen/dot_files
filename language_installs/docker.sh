#!/bin/bash

sudo pacman -S docker
sudo systemctl start docker.service
sudo systemctl enable docker.service

sudo usermod -aG docker $USER
newgrp docker

sudo pacman -S docker-compose
sudo pacman -S bash-completion
