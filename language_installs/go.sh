#!/bin/bash

rm -rf /usr/local/go
wget -O go_install.tar.gz https://go.dev/dl/go1.24.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go_install.tar.gz

rm go_install.tar.gz

