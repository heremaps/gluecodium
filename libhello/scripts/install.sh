#!/bin/bash

. "scripts/build.sh"

if [ ! -d ${BUILD_DIR} ] ; then
    die "Compilation failed!"
fi

cd ${BUILD_DIR}
safe ninja install
cd ${CWD}
