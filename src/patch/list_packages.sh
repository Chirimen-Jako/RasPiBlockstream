#!/bin/bash
echo "---requirements---"
apt list build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev
echo "---optional---"
apt list libminiupnpc-dev libzmq3-dev
echo "---Qt5---"
apt list libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
echo ---Qt4---
apt list libqt4-dev libprotobuf-dev protobuf-compiler
echo "---GUI (optional)---"
apt list libqrencode-dev
echo "---gnuradio---"
apt list rtl-sdr libuhd-dev osmo-sdr bladerf libsoapysdr-dev hackrf airspy libgsm1-dev gpsd libcodec2-dev libcomedi-dev libncurses5-dev doxygen python-sphinx
