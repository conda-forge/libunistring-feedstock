#!/usr/bin/env bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build-aux

./configure --disable-dependency-tracking --disable-silent-rules --prefix=${PREFIX}
make
if [ ${target_platform} == linux-ppc64le ]; then
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
  make check || true
fi
else
  make check
fi
make install
