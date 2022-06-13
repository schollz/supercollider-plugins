#!/bin/bash


#wget https://github.com/supercollider/supercollider/archive/refs/tags/Version-3.12.2.tar.gz
#tar -xvzf Version-3.12.2.tar.gz

# git submodule update --init --recursive
# sudo apt install cmake

# requires a fix to the dsp.h: https://github.com/electro-smith/DaisySP/issues/149
# sed -i -e 's/__arm__/__armdisable__/g' portedplugins/DaisySP/Source/Utility/dsp.h

# cd portedplugins
# rm -rf build
# mkdir -p build 
# cd build
# cmake .. -DCMAKE_BUILD_TYPE='Release' -DSC_PATH="/home/we/dust/code/supercollider-engines/supercollider-Version-3.12.2/" -DCMAKE_INSTALL_PREFIX="/home/we/dust/code/supercollider-engines/built/"
# cmake --build . --config Release
# cmake --build . --config Release --target install

cd /home/we/dust/code/supercollider-engines/mi-UGens
chmod +x build.sh
./build.sh /home/we/dust/code/supercollider-engines/supercollider-Version-3.12.2/
