## build lib & utils
#!bin/bash

##############################################
# default dir
TOP_DIR=`pwd`
LIB_DIR=${TOP_DIR}/alsa-lib-1.1.7
UTILS_DIR=${TOP_DIR}/alsa-utils-1.1.7
#echo $LIB_DIR $UTILS_DIR

###############################################
# user config
CROSS_COMPILE=arm-linux-gnueabihf
CC=${CROSS_COMPILE}-gcc
CXX=${CROSS_COMPILE}-g++
LD=${CROSS_COMPILE}-ld

PREFIX=${TOP_DIR}/alsa-install
PLUGIN_DIR=${PREFIX}/plugin
CONFIG_DIR=/customer
#echo $PREFIX $PLUGIN_DIR 

###############################################
## compile library
cd ${LIB_DIR}
./configure --host=${CROSS_COMPILE} CC=${CC} CXX=${CXX} LD=${LD} --enable-shared --disable-python --prefix=${PREFIX} --with-configdir=${CONFIG_DIR} --with-plugindir=${PLUGIN_DIR}
make clean -j32;make -j32;make install
cd -

###############################################
## compile utils
ACFLAGS=`"-I${PREFIX}/include"`
ALDFLAGS=`"-L/${PREFIX}/lib -lasound"`
ALSA_INC=${PREFIX}/include
ALSA_LIB=${PREFIX}/lib
UDEV_RULER_DIR=${PREFIX}/udev_ruler
ASOUND_STATE_DIR=${PREFIX}/asound_state

cd ${UTILS_DIR}
./configure --host=${CROSS_COMPILE} CC=${CC} LD=${LD} --prefix=${PREFIX} CFLAGS=$ACFLAGS LDFLAGS=$ALDFLAGS --disable-alsamixer --disable-xmlto --with-alsa-inc-prefix=${ALSA_INC} --with-alsa-prefix=${ALSA_LIB} --with-systemdsystemunitdir=${PREFIX}/systemdsystemunit --with-udev-rules-dir=${UDEV_RULER_DIR} --with-asound-state-dir=${ASOUND_STATE_DIR}
make clean -j31;make -j32;make install
cd -
