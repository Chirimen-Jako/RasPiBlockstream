#!/bin/sh
if [ ! -e ./bootstrap.sh.orig ]; then
  patch --backup ./bootstrap.sh < ~/apache-thrift.bootstrap.sh.patch 
fi
