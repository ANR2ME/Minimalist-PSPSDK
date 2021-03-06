#!/bin/bash
set -e
. ../util/util.sh

LIBNAME=mikmodlib
VERSION=3.0

svnGet build http://psp.jim.sh/svn/psp/trunk $LIBNAME

cd build/$LIBNAME
make libs

mkdir -p ../target/psp/include ../target/psp/lib ../target/doc/$LIBNAME
cp include/* ../target/psp/include
cp lib/* ../target/psp/lib
# to avoid overwrite the libmikmod
mv ../target/psp/lib/libmikmod.a libmikmodlib.a
cp docs/*.doc ../target/doc/$LIBNAME
cp docs/*.txt ../target/doc/$LIBNAME

cd ../..

makeInstaller $LIBNAME $VERSION

echo "Done!"
