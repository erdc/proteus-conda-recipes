#!/bin/bash

if [ `uname -m` == ppc64le ]; then
    B="--build=ppc64le-linux"
fi

export CC=mpicc
export CXX=mpic++

./configure $B --prefix=$PREFIX --disable-static \
    --enable-linux-lfs --with-zlib --with-ssl \
    --enable-threadsafe --with-pthread=yes \
    --enable-production --enable-cxx \
    --enable-parallel=yes \
    --enable-unsupported
make
make install

rm -rf $PREFIX/share/hdf5_examples
