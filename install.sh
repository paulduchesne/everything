# raspberry updates

sudo apt-get update  
sudo apt-get -y upgrade  
sudo apt-get dist-upgrade  
sudo apt-get -y install libsamplerate0-dev libsndfile1-dev libasound2-dev libavahi-client-dev libreadline-dev libfftw3-dev libudev-dev cmake git 

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

git clone --recursive http://github.com/supercollider/supercollider
cd supercollider  
git checkout main 
git submodule init && git submodule update  
mkdir build && cd build  
cmake -L -DCMAKE_BUILD_TYPE="Release" -DBUILD_TESTING=OFF -DSUPERNOVA=OFF -DNATIVE=ON -DSC_IDE=OFF -DNO_X11=ON -DSC_QT=OFF -DSC_ED=OFF -DSC_EL=OFF -DSC_VIM=ON ..  
make  
sudo make install  
sudo ldconfig  

# autostart script

cat >~/autostart.sh <<EOF
#!/bin/bash
export PATH=/usr/local/bin:$PATH
export DISPLAY=:0.0
sleep 10 # can be lower (5) for rpi3
sclang ~/everything/test.scd
EOF

chmod +x ~/autostart.sh

echo "@reboot ~/autostart.sh" >> ~/cron.txt
crontab cron.txt
