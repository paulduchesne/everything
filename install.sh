
# pull dependancies

sudo apt-get -y install build-essential \
  libsndfile1-dev \
  libasound2-dev \
  libavahi-client-dev \
  libicu-dev \
  libreadline6-dev \
  libncurses5-dev \
  libfftw3-dev \
  libxt-dev \
  libudev-dev \
  pkg-config \
  git \
  cmake \
  qtbase5-dev \
  qt5-qmake \
  qttools5-dev \
  qttools5-dev-tools \
  qtdeclarative5-dev \
  qtpositioning5-dev \
  libqt5sensors5-dev \
  libqt5opengl5-dev \
  qtwebengine5-dev \
  libqt5svg5-dev \
  libqt5websockets5-dev \
  libjack-jackd2-dev 

# pull it repo

git clone --recursive https://github.com/supercollider/supercollider.git

# build commands

cd supercollider/
mkdir build 
cd build
cmake -DNATIVE=ON -DSC_EL=OFF ..
make
sudo make install
make -j4
sudo make install
sudo ldconfig

