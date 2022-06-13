#!/bin/bash

# get the modules
git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard
git submodule update --init --recursive
sudo apt install cmake


# download SuperCollider source
wget https://github.com/supercollider/supercollider/archive/refs/tags/Version-3.12.2.tar.gz
tar -xvzf Version-3.12.2.tar.gz

# build ported plugins
# requires a fix to the dsp.h: https://github.com/electro-smith/DaisySP/issues/149
sed -i -e 's/__arm__/__armdisable__/g' src/portedplugins/DaisySP/Source/Utility/dsp.h
cd src/portedplugins
rm -rf build
mkdir -p build 
cd build
cmake .. -DCMAKE_BUILD_TYPE='Release' -DSC_PATH="/home/we/dust/code/supercollider-engines/supercollider-Version-3.12.2/" -DCMAKE_INSTALL_PREFIX="/home/we/dust/code/supercollider-engines/src/portedplugins/built/"
cmake --build . --config Release
cmake --build . --config Release --target install
rm -rf PortedPlugins
mv /home/we/dust/code/supercollider-engines/src/portedplugins/built/PortedPlugins /home/we/dust/code/supercollider-engines/

# build mi-UGens
cd /home/we/dust/code/supercollider-engines/src/mi-UGens
chmod +x build.sh
./build.sh /home/we/dust/code/supercollider-engines/supercollider-Version-3.12.2/
rm -rf mi-Ugens
mv /home/we/dust/code/supercollider-engines/src/mi-UGens/build/mi-UGens /home/we/dust/code/supercollider-engines/

# clean up
rm -rf supercollider-Version-3.12.2 Version-3.12.2.tar.gz
git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git reset --hard
