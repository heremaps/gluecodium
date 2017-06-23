#!/bin/bash
#
# Script to install build artifacts for the entire project
#
# Invokes ./scripts/build.sh to make sure those artifacts exist.
# If you created the build folder manually or via ./scripts/build.sh
# before it should just use whatever is cached by CMake.

. "scripts/build.sh"

if [ ! -d ${BUILD_DIR} ] ; then
    die "Compilation failed!"
fi

cd ${BUILD_DIR}
safe ninja install
cd ${CWD}
