#!/bin/sh

set -eu

# install build tools
yum install -y git cmake make gcc-c++

# install required libraries
yum install -y qt4-devel libgcrypt-devel libXtst-devel

# clone and build
git clone https://github.com/keepassx/keepassx.git
cd keepassx
git checkout 2.0-alpha6
mkdir -p build
cd build
cmake ..
make -j2
make install
