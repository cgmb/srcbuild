#!/bin/bash

set -eu -o pipefail

version='4.8.6'
major_version=$(echo "$version" | cut -d. -f 1)
minor_version=$(echo "$version" | cut -d. -f 2)
name="qt-everywhere-opensource-src-$version"
url="http://download.qt-project.org/official_releases/qt/$major_version.$minor_version/$version/$name.tar.gz"
curl -L "$url" | tar -zx
cd "$name"

install_dir="$HOME/opt/qt-$version"
./configure -prefix "$install_dir" -opensource -confirm-license -optimized-qmake -nomake examples -nomake tests -no-webkit
make -j 4
make install

cd ..
rm -rf -- "$name"
