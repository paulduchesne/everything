#!/bin/bash

# install libs

sudo apt -y update
sudo apt -y upgrade
sudo apt -y dist-upgrade  
sudo apt -y install libsamplerate0-dev \
    libsndfile1-dev \
    libasound2-dev \
    libavahi-client-dev \
    libreadline-dev \
    libfftw3-dev \
    libudev-dev \
    libjack-jackd2-dev \
    libxt-dev \
    libncurses5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    qtbase5-dev \
    libqt5svg5-dev \
    qjackctl \
    tigervnc-standalone-server \
    cmake \
    git
    
# install jack

cd && git clone https://github.com/jackaudio/jack2.git --depth 1 
cd jack2  
./waf configure --alsa --libdir=/usr/lib/arm-linux-gnueabihf/  
./waf build  
sudo ./waf install  
sudo ldconfig  
cd ..  
rm -rf jack2  
sudo sh -c "echo @audio - memlock 256000 >> /etc/security/limits.conf"  
sudo sh -c "echo @audio - rtprio 75 >> /etc/security/limits.conf"  
echo /usr/local/bin/jackd -P75 -dalsa -dhw:pisound -r48000 -p512 -n3 > ~/.jackdrc  

# install supercollider

cd && git clone --recurse-submodules https://github.com/supercollider/supercollider.git
cd supercollider
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release \
    -DSUPERNOVA=OFF \
    -DSC_EL=OFF \
    -DSC_VIM=ON \
    -DNATIVE=ON \
    -DSC_USE_QTWEBENGINE:BOOL=OFF ..
cmake --build . --config Release --target all -- -j3
sudo cmake --build . --config Release --target install
sudo ldconfig

# clone repo

git clone https://github.com/paulduchesne/everything.git
