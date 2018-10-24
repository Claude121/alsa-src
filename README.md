## ALSA SRC
### alsa lib
1. congfiuration (arch, compiler, include_dir, config_dir, plugin_dir)
```
./configure --host=arm-linux CC=arm-linux-gcc --enable-shared --disable-python --prefix=/users/claude.rao/Code/App/alsa/alsa-src/alsa-install/ --with-configdir=/users/claude.rao/Code/App/alsa/alsa-src/alsa-install/config --with-plugindir=/users/claude.rao/Code/App/alsa/alsa-src/alsa-install/plugin
```
2. make & make install

### alsa utils
1. configuration
```
./configure --host=arm-linux CC=arm-linux-gcc --prefix=/users/claude.rao/Code/App/alsa/alsa-src/alsa-install/ CFLAGS="-I/users/claude.rao/Code/App/alsa/alsa-src/alsa-install/include" LDFLAGS="-L/users/claude.rao/Code/App/alsa/alsa-src/alsa-install/lib -lasound" --disable-alsamixer --disable-xmlto --with-alsa-inc-prefix=/users/claude.rao/Code/App/alsa/alsa-src/alsa-install/include --with-alsa-prefix=/users/claude.rao/Code/App/alsa/alsa-src/alsa-install/lib --with-systemdsystemunitdir=/users/claude.rao/Code/App/alsa/alsa-src/alsa-install/systemdsystemunit --with-udev-rules-dir=/users/claude.rao/Code/App/alsa/alsa-src/alsa-install/udev_ruler --with-asound-state-dir=/users/claude.rao/Code/App/alsa/alsa-src/alsa-install/asound_state
```
2. touch alsaconf/po/t-ja.gmo & touch alsaconf/po/ru.gmo
```
to solve mv: cannot stat 't-ja.gmo': No such file or directory ...
```
2. make & make install
