#!/bin/sh

##################
## Config Param ##
##################
DEBUG=false

INSTALL_PATH=$PWD/../alsa-install
CONFIG_PATH=/customer/config
PLUGIN_PATH=${CONFIG_PATH}/plugin

HOST=arm-linux-gnueabihf
CROSS_COMPILE=arm-linux-gnueabihf-
CC=${CROSS_COMPILE}-gcc

LINK_TYPE=dynamic
ENABLE_PYTHON=no

##################
### Reset Param ##
##################
if [ $LINK_TYPE = "static" ]; then
    LINK="--enable-static=yes --enable-shared=no"
else
    LINK="--enable-static=no --enable-shared=yes"
fi

if [ $ENABLE_PYTHON = "yes" ];then
    PYTHON="--enable-python"
else
    PYTHON="--disable-python"
fi

##################
##### Debug ######
##################
if $DEBUG;then
echo "LINK          :" $LINK
echo "PYTHON        :" $PYTHON
echo "HOST          :" $HOST
echo "INSTALL_PATH  :" $INSTALL_PATH
echo "CONFIG_PATH   :" $CONFIG_PATH
echo "PLUGIN_PATH   :" $PLUGIN_PATH
echo "CROSS_COMPILE :" $CROSS_COMPILE
exit 0
fi

##################
##### Exec #######
##################
./configure --host=${HOST} ${LINK} ${PYTHON} --prefix=${INSTALL_PATH} --with-configdir=${CONFIG_PATH} --with-plugindir=${PLUGIN_PATH}
make clean;make -j32;make install
