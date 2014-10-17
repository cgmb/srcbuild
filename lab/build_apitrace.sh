#!/bin/sh

set -eu

git clone https://github.com/apitrace/apitrace.git
cd apitrace
git checkout 5.0
mkdir -p build
cd build
CMAKE_PREFIX_PATH=$HOME/opt/qt-4.8.6 cmake -DENABLE_GUI=TRUE ..
make -j2
