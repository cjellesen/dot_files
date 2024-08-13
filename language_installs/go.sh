#!/bin/bash

rm -rf /usr/local/go
wget -O go_install.tar.gz https://go.dev/dl/go1.22.5.linux-amd64.tar.gz
tar -C /usr/local -xzf go_install.tar.gz

rm go_install.tar.gz

export PATH=$PATH:/usr/local/go/bin
