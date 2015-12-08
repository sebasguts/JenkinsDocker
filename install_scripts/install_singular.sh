#!/bin/bash -e

echo "installing Singular"

number_cores=$(cat /proc/cpuinfo | grep processor | wc -l)

sudo mkdir /opt2
cd /opt2
sudo mkdir Singular
sudo chown -hR jenkins Singular
cd Singular
git clone https://github.com/Singular/Sources.git
cd Sources
git checkout $1
./autogen.sh
./configure --enable-gfanlib --with-flint=yes --with-gmp=$2
make -j${number_cores}
make check
sudo make install
