## build lib & utils
#!bin/bash

# default dir
TOP_DIR=`pwd`
LIB_DIR=${TOP_DIR}/alsa-lib-1.1.7
UTILS_DIR=${TOP_DIR}/alsa-utils-1.1.7
#echo $LIB_DIR $UTILS_DIR

# user config
CROSS_COMPILE=arm-linux-gnueabihf
CC=${CROSS_COMPILE}-gcc
CXX=${CROSS_COMPILE}-g++

PREFIX=${TOP_DIR}/alsa-install
PLUGIN_DIR=${PREFIX}/plugin
CONFIG_DIR=/customer
#echo $PREFIX $PLUGIN_DIR 

## compiler library
cd ${LIB_DIR}
./configure --host=${CROSS_COMPILE} CC=${CC} --enable-shared --disable-python --prefix=${PREFIX} --with-configdir=${CONFIG_DIR} --with-plugindir=${PLUGIN_DIR}/plugin
make clean -j32 & make -j32 & make install
cd -
