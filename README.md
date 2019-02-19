## ALSA SRC
alsautil -- > alsa_lib --> alsa_plugin(so)
### alsa lib
1. congfiuration (arch, compiler, include_dir, config_dir, plugin_dir)
```
./configure --host=arm-linux-gnueabihf CC=arm-linux-gnueabihf-gcc --enable-static=no --enable-shared=yes --disable-python --prefix=$PWD/alsa-install/ --with-configdir=$PWD/alsa-install/config --with-plugindir=$PWD/alsa-install/plugin
```
2. make & make install

### alsa utils
1. configuration
```
./configure --host=arm-linux CC=arm-linux-gcc --prefix=$PWD/alsa-install/ CFLAGS="-I$PWD/alsa-install/include" LDFLAGS="-L$PWD/alsa-install/lib -lasound" --disable-alsamixer --disable-xmlto --with-alsa-inc-prefix=$PWD/alsa-install/include --with-alsa-prefix=$PWD/alsa-install/lib --with-systemdsystemunitdir=$PWD/alsa-install/systemdsystemunit --with-udev-rules-dir=$PWD/alsa-install/udev_ruler --with-asound-state-dir=$PWD/alsa-install/asound_state
```
2. touch alsaconf/po/t-ja.gmo & touch alsaconf/po/ru.gmo
```
to solve mv: cannot stat 't-ja.gmo': No such file or directory ...
```
2. make & make install

### alsa plugin
