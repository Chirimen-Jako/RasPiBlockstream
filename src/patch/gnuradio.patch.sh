#!/bin/bash
pwd
pushd ..
if [ ! -e ./CMakeLists.txt.orig ]; then
  patch --backup ./CMakeLists.txt < ~/gnuradio.CMakeLists.txt.patch
fi
if [ ! -e ./volk/lib/CMakeLists.txt.orig ]; then
  patch --backup ./volk/lib/CMakeLists.txt < ~/gnuradio.volk.lib.CMakeLists.txt.patch
fi
popd
