#!/bin/bash

set -eu -o pipefail

version='5.3.2'
major_version=$(echo "$version" | cut -d. -f 1)
minor_version=$(echo "$version" | cut -d. -f 2)
name="qt-everywhere-opensource-src-$version"
url="http://download.qt-project.org/official_releases/qt/$major_version.$minor_version/$version/single/$name.tar.gz"
curl -L "$url" | tar -zx
cd "$name"

install_dir="$HOME/opt/qt-$version"
./configure -prefix "$install_dir" -opensource -confirm-license -qt-xcb -optimized-qmake -nomake examples -nomake tests -skip qtwebkit -skip qtwebkit-examples -skip qtwebsockets
make -j 4
make install

cd ..
rm -rf -- "$name"
