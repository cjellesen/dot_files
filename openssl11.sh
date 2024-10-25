#/bin/bash
wget https://www.openssl.org/source/openssl-1.1.1c.tar.gz
tar -xzvf openssl-1.1.1c.tar.gz
cd openssl-1.1.1c
./config
make
# (it puts it into /usr/local/lib so it doesn't mess with the rest of your system)
sudo make install 

