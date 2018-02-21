#!/bin/bash
pushd ..
if [ ! -e ./CMakeLists.txt.orig ]; then
  patch --backup ./CMakeLists.txt < ~/gr-framers.CMakeLists.txt.patch
fi
popd
