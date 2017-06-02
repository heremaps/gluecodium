#!/bin/bash

. "scripts/inc.functions"

BUILD_DIR=build
CWD=$PWD

if [ ! -d ${BUILD_DIR} ] ; then
    mkdir -p ${BUILD_DIR}
    cd ${BUILD_DIR}
    cmake \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=$CWD/dist \
        -G Ninja \
        ..
    cd ${CWD}
fi

safe cmake --build ${BUILD_DIR}
