#!/bin/bash

mkdir install-debug
mkdir install-release

mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../install-release -G Ninja ..
ninja
ninja install

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../install-debug -G Ninja ..
ninja
ninja install

