#!/bin/bash
HOME_PREFIX="$HOME/prefix"
#
# Check sudo password.
#
sudo echo "hello, checking sudo password is OK."
#
# Check username
#
if [ "$USER" == "pi" ]; then
  echo "username is 'pi'."
else
  echo "Warning: We checked out this installation using user 'pi' account only."
  echo "DO YOU WANT TO CONTINUE? [y/N]"
  read ANSWER
  case $ANSWER in
    "Y" | "y" | "yes" | "Yes" | "YES" ) echo "continue... (ON YOUR OWN RISK!)";;
    * ) echo "STOPPED." && exit;;
  esac
fi
#
# Check pip command
#
echo "Checking pip command..."
which pip
if [ $? -eq 0 ]; then
  echo "pip command OK."
else
  echo "Error: pip command not found. Did you apply overall upgrade in the Installation Guide?"
  echo "STOPPED."
  exit
fi
#
# Check swap partition
#
echo "Checking swap files..."
swapon
swapon | grep "mmcblk0" >/dev/null
if [ $? -eq 0 ]; then
  echo "swap partition mmcblk0 found."
else
  echo "swap partition mmcblk0 not found."
  echo "DO YOU WANT TO CONTINUE? [y/N]"
  read ANSWER
  case $ANSWER in
    "Y" | "y" | "yes" | "Yes" | "YES" ) echo "continue... (ON YOUR OWN RISK!)";;
    * ) echo "STOPPED." && exit;;
  esac
fi
cd
#
# Cleanup old files
#
sudo rm -rd ${HOME_PREFIX}
sudo rm -rd ~/.pybombs
sudo rm -rd ~/satellite
sudo rm -rd ~/bitcoinfibre
#
# Set environment variables
#
echo $(eval echo 'export PATH="${HOME_PREFIX}/bin:${PATH}"') >> ~/.profile
echo $(eval echo 'export PYTHONPATH="${HOME_PREFIX}/lib/python2.7/site-packages:${HOME_PREFIX}/lib/python2.7/dist-packages:/usr/local/lib/python2.7/site-packages:/usr/local/lib/python2.7/dist-packages"') >> ~/.profile
echo $(eval echo 'export LD_LIBRARY_PATH="${HOME_PREFIX}/lib"') >> ~/.profile
echo $(eval echo 'sudo ldconfig') >> ~/.profile
#
# Reload environment variables
#
source ~/.profile
sudo ldconfig
#
# Install PYBOMBS
#
sudo pip install pybombs
pybombs --version
#
# Upgrade PYBOMBS
#
sudo pip install --upgrade git+https://github.com/gnuradio/pybombs.git
pybombs --version
#
# Install gnuradio
#
pybombs auto-config
pybombs recipes add-defaults
#
# Cleanup packages
#
sudo apt -y remove rtl-sdr          # Don't install it from package.
sudo apt -y remove libuhd-dev       # Don't install it from package.
sudo apt -y remove osmo-sdr         # Don't install it from package.
sudo apt -y remove bladerf          # Don't install it from package.
sudo apt -y remove libsoapysdr-dev  # Don't install it from package.
sudo apt -y remove hackrf           # Don't install it from package.
sudo apt -y remove airspy           # Don't install it from package.
sudo apt -y remove libgsm1-dev      # Don't install it from package.
sudo apt -y remove gpsd             # Don't install it from package.
sudo apt -y remove libcodec2-dev    # Don't install it from package.
sudo apt -y install libboost-thread-dev libboost-chrono-dev
sudo apt -y install libevent-dev
sudo apt -y install libcomedi-dev
sudo apt -y install libncurses5-dev
sudo apt -y install libminiupnpc-dev
sudo apt -y install libzmq3-dev
sudo apt -y install doxygen
sudo apt -y install python-sphinx
#
# Specific patches for Raspberry Pi 3 model B
#
if [ ! -e ~/.pybombs/recipes/gr-recipes/apache-thrift.lwr.orig ]; then
  patch --backup ~/.pybombs/recipes/gr-recipes/apache-thrift.lwr < ~/apache-thrift.recipes.gr-recipes.apache-thrift.lwr.patch
fi
if [ ! -e ~/.pybombs/recipes/gr-recipes/uhd.lwr.orig ]; then
  patch --backup ~/.pybombs/recipes/gr-recipes/uhd.lwr < ~/uhd.recipes.gr-recipes.uhd.lwr.patch
fi
if [ ! -e ~/.pybombs/recipes/gr-recipes/gnuradio.lwr.orig ]; then
  patch --backup ~/.pybombs/recipes/gr-recipes/gnuradio.lwr < ~/gnuradio.recipes.gr-recipes.gnuradio.lwr.patch
fi
if [ ! -e ~/.pybombs/recipes/gr-recipes/soapysdr.lwr.orig ]; then
  patch --backup ~/.pybombs/recipes/gr-recipes/soapysdr.lwr < ~/soapysdr.recipes.gr-recipes.soapysdr.lwr.patch
fi
if [ ! -e ~/.pybombs/recipes/gr-etcetera/gr-framers.lwr.orig ]; then
  patch --backup ~/.pybombs/recipes/gr-etcetera/gr-framers.lwr < ~/gr-framers.recipes.gr-etcetera.gr-framers.lwr.patch
fi
#
# Install gnuradio and recipes
#
git clone git://git.osmocom.org/osmo-sdr.git osmo-sdr
pybombs -y -vv prefix init ${HOME_PREFIX} -a myprefix -R gnuradio-default
cd ${HOME_PREFIX}
pybombs -y -v install rtl-sdr
if [ ! -e /etc/udev/rules.d/rtl-sdr.rules ]; then
  sudo cp ${HOME_PREFIX}/src/rtl-sdr/rtl-sdr.rules /etc/udev/rules.d/
fi
pybombs -y -v install osmo-sdr
pybombs -y -v install bladeRF
pybombs -y -v install soapysdr
pybombs -y -v install hackrf
pybombs -y -v install airspy
pybombs -y -v install libosmo-dsp
pybombs -y -v install gr-iqbal
pybombs -y -v install gr-osmosdr
#
# Install Blockstream satellite (install gr-framers)
#
cd
pybombs -y -v remove gr-framers
sudo rm -rd ${HOME_PREFIX}/src/gr-framers
sudo rm -rd ${HOME_PREFIX}/src/gr-mods
git clone https://github.com/Blockstream/satellite
pybombs -y -v install gr-framers
#
# Install Blockstream satellite (install mods)
#
cd ~/satellite
cp -rd gr-mods ${HOME_PREFIX}/src/
cd ${HOME_PREFIX}/src
# Check if the build directory exists
if [ -d ./gr-mods/build ]; then
  sudo rm -rd ./gr-mods/build
fi
mkdir ./gr-mods/build
cd ./gr-mods/build
~/gr-mods.CMakeLists.txt.patch.sh
cmake .. -DCMAKE_PREFIX_PATH=${HOME_PREFIX}/lib/cmake/gnuradio
make -j4
sudo make install
# Copy gr-mods/grc/mods*.xml blocks to *LOCAL* share/gnuradio/grc/blocks
sudo cp -v ${HOME_PREFIX}/src/gr-mods/grc/*.xml ${HOME_PREFIX}/share/gnuradio/grc/blocks
# Copy gr-mods/build/lib/*.so* to *LOCAL* lib
cp -vR ${HOME_PREFIX}/src/gr-mods/build/lib/*.so* ${HOME_PREFIX}/lib
#
# Install Bitcoin FIBRE
#
# If you want to build bitcoin-qt, install Qt5
sudo apt -y install qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
# Bitcoin FIBRE optional
sudo apt -y -v install libqrencode-dev
cd
git clone https://github.com/bitcoinfibre/bitcoinfibre
cd bitcoinfibre
./autogen.sh
./configure --disable-wallet --enable-upnp-default CXXFLAGS="-march=armv7-a -mtune=cortex-a53 -mthumb -mfpu=neon -mfloat-abi=hard --param ggc-min-expand=1 --param ggc-min-heapsize=32768"
make -j4
sudo make install
cd
echo 'everything finished.'