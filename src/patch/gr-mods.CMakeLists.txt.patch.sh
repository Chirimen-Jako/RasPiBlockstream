#!/bin/bash
pushd ..
if [ ! -e ./CMakeLists.txt.orig ]; then
  patch --backup ./CMakeLists.txt < ~/gr-mods.CMakeLists.txt.patch
fi
popd
