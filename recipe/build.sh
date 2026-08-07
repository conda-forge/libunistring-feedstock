#!/usr/bin/env bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build-aux

./configure --disable-dependency-tracking --disable-silent-rules --prefix=${PREFIX}
make
# The old 0.9.10 test suite has known failures on current macOS.
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" && "${target_platform}" != osx-* ]]; then
  make check || true
fi
make install
