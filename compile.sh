#!/bin/bash

mkdir install-debug
mkdir install-release

mkdir build
cd build

# No difference between debug/release here
cmake -DCMAKE_INSTALL_PREFIX=../install-release -G Ninja ..
ninja
ninja install

cmake -DCMAKE_INSTALL_PREFIX=../install-debug -G Ninja ..
ninja
ninja install
