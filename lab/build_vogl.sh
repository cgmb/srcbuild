#!/bin/sh

set -eu

qt5_dir="$HOME/opt/qt-5.3.2"

git clone https://github.com/ValveSoftware/vogl.git
mkdir -p vogl/vogl_build/release64 && cd $_ 
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_X64=On -DQt5_DIR="$qt5_dir/lib/cmake/Qt5" ../..
