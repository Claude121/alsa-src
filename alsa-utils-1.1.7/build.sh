#!/bin/sh

##################
## Config Param ##
##################
DEBUG=false

INSTALL_PATH=$PWD/alsa-install

HOST=arm-linux-gnueabihf
CROSS_COMPILE=arm-linux-gnueabihf-

LINK_TYPE=dynamic

ALSA_LIB_TOP="$PWD/../alsa-install"
ALSA_LIB_DIR="${ALSA_LIB_TOP}/lib"
ALSA_INCLUDE_DIR="${ALSA_LIB_TOP}/include"

CFLAGS="-I${ALSA_INCLUDE_DIR}"
LDFLAGS="-L${ALSA_LIB_DIR} -lasound"
ALSA_MIXER="--disable-alsamixer"

INSTALL_SYSTEM="${INSTALL_PATH}/systemdsystemunit"
UDEV_DIR="${INSTALL_PATH}/udev_ruler"
ASOUND_STATE="${INSTALL_PATH}/asound_state"

##################
### Reset Param ##
##################
if [ $LINK_TYPE = "static" ]; then
  #  LINK="--enable-static=yes --enable-shared=no"
  LINK=""
else
  #  LINK="--enable-static=no --enable-shared=yes"
  LINK=""
fi

##################
##### Debug ######
##################
if $DEBUG;then
echo "LINK          :" $LINK
echo "HOST          :" $HOST
echo "INSTALL_PATH  :" $INSTALL_PATH
echo "CROSS_COMPILE :" $CROSS_COMPILE
echo "ALSA_LIB_TOP  :" $ALSA_LIB_TOP
echo "CFLAGS        :" $CFLAGS
echo "LDFLAGS       :" $LDFLAGS
exit 0
fi

##################
##### Exec #######
##################
./configure --host=${HOST} ${LINK} --prefix=${INSTALL_PATH} CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" ${ALSA_MIXER} --disable-xmlto --with-alsa-inc-prefix=${ALSA_INCLUDE_DIR} --with-alsa-prefix=${ALSA_LIB_DIR} --with-systemdsystemunitdir=${INSTALL_SYSTEM} --with-udev-rules-dir=${UDEV_DIR} --with-asound-state-dir=${ASOUND_STATE}

make clean;make -j32;make install
