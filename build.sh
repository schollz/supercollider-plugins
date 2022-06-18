#!/bin/bash

# get the modules
git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard
git submodule update --init --recursive
sudo apt install cmake


# download SuperCollider source
make

# pulseptr
cd /home/we/dust/code/supercollider-plugins/src/pulseptr
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/we/dust/code/supercollider-plugins/ -DSC_PATH="/home/we/dust/code/supercollider-plugins/supercollider-Version-3.12.2/" -DSUPERNOVA=OFF
cmake --build . --config Release
exit

# triangleptr
cd /home/we/dust/code/supercollider-plugins/src/triangleptr
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/we/dust/code/supercollider-plugins/ -DSC_PATH="/home/we/dust/code/supercollider-plugins/supercollider-Version-3.12.2/" -DSUPERNOVA=OFF
cmake --build . --config Release
cmake --build . --config Release --target install

# supercollider-cd-skip
cd /home/we/dust/code/supercollider-plugins/src/supercollider-cd-skip
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/we/dust/code/supercollider-plugins/ -DSC_PATH="/home/we/dust/code/supercollider-plugins/supercollider-Version-3.12.2/" -DSUPERNOVA=OFF
cmake --build . --config Release
cmake --build . --config Release --target install

# IBufWr
cd /home/we/dust/code/supercollider-plugins/src/IBufWr
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/we/dust/code/supercollider-plugins/src/IBufWr/built/ -DSC_PATH="/home/we/dust/code/supercollider-plugins/supercollider-Version-3.12.2/" -DSUPERNOVA=OFF
cmake --build . --config Release
cmake --build . --config Release --target install
mkdir -p /home/we/dust/code/supercollider-plugins/IBufWr
mv /home/we/dust/code/supercollider-plugins/src/IBufWr/build/IBufWr.so /home/we/dust/code/supercollider-plugins/IBufWr/
mv /home/we/dust/code/supercollider-plugins/src/IBufWr/IBufWr.sc /home/we/dust/code/supercollider-plugins/IBufWr/

# build redFrik plugins
cd /home/we/dust/code/supercollider-plugins/src/f0plugins
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/we/dust/code/supercollider-plugins/src/f0plugins/built/ -DSC_PATH="/home/we/dust/code/supercollider-plugins/supercollider-Version-3.12.2/" -DSUPERNOVA=OFF
cmake --build . --config Release
cmake --build . --config Release --target install
cp -r /home/we/dust/code/supercollider-plugins/src/f0plugins/built/f0plugins /home/we/dust/code/supercollider-plugins/


# build ported plugins
# requires a fix to the dsp.h: https://github.com/electro-smith/DaisySP/issues/149
cd /home/we/dust/code/supercollider-plugins
sed -i -e 's/__arm__/__armdisable__/g' src/portedplugins/DaisySP/Source/Utility/dsp.h
cd src/portedplugins
rm -rf build
mkdir -p build 
cd build
cmake .. -DCMAKE_BUILD_TYPE='Release' -DSC_PATH="/home/we/dust/code/supercollider-plugins/supercollider-Version-3.12.2/" -DCMAKE_INSTALL_PREFIX="/home/we/dust/code/supercollider-plugins/src/portedplugins/built/" -DSUPERNOVA=OFF
cmake --build . --config Release
cmake --build . --config Release --target install
rm -rf PortedPlugins
mv /home/we/dust/code/supercollider-plugins/src/portedplugins/built/PortedPlugins /home/we/dust/code/supercollider-plugins/

# build mi-UGens
sed -i -e 's/-DSC_PATH/-DSUPERNOVA=OFF -DSC_PATH/g' /home/we/dust/code/supercollider-plugins/src/mi-UGens/build.sh
cd /home/we/dust/code/supercollider-plugins/src/mi-UGens
chmod +x build.sh
./build.sh /home/we/dust/code/supercollider-plugins/supercollider-Version-3.12.2/
rm -rf mi-Ugens
mv /home/we/dust/code/supercollider-plugins/src/mi-UGens/build/mi-UGens /home/we/dust/code/supercollider-plugins/


# clean up
cd /home/we/dust/code/supercollider-plugins
rm -rf supercollider-Version-3.12.2 Version-3.12.2.tar.gz
git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard
