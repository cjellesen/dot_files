#!/bin/bash

rm -rf /usr/local/go
wget -O go_install.tar.gz https://go.dev/dl/go1.22.5.linux-386.tar.gz
tar -C /usr/local -xzf go_install.tar.gz

# Rembember to decare a go PATH if it does not exists:
# export PATH=$PATH:/usr/local/go/bin

rm go_install.tar.gz
