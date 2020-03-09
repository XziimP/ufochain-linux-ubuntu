#!/bin/bash

apt-get -y update
apt-get -y install wget gcc-8 unzip libssl1.0.0 software-properties-common
add-apt-repository -y ppa:ubuntu-toolchain-r/test
apt-get -y update
apt-get -y install --only-upgrade libstdc++6

add-apt-repository -y ppa:beineri/opt-qt-5.11.0-bionic
add-apt-repository -y ppa:mhier/libboost-latest
apt-get -y update
apt-get -y upgrade
apt-get -y install g++-8 libssl-dev curl wget git make
apt-get -y install libgl1-mesa-dev zlib1g-dev libboost1.67-dev
apt-get -y install qt511base qt511declarative qt511svg qt511tools
apt-get clean

wget https://cmake.org/files/v3.13/cmake-3.13.0-Linux-x86_64.sh
sh ./cmake-3.13.0-Linux-x86_64.sh --skip-license --prefix=/usr

cd

git clone https://github.com/ufo-project/ufochain.git

cd ufochain

# fix filename character case not work on linux
# cp ui/icons/ufo_mainnet.png ui/icons/UFO_mainnet.png
# cp ui/icons/ufo_mainnet.icns ui/icons/UFO_mainnet.icns

export PATH=/opt/qt511/bin:$PATH && export CC=gcc-8 && export CXX=g++-8
cmake -DCMAKE_BUILD_TYPE=Release && make -j4
