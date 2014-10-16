#!/bin/sh

set -eu

git clone https://github.com/apitrace/apitrace.git
cd apitrace
git checkout 5.0
mkdir -p build
cd build
cmake ..
make -j2
