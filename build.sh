#!/bin/bash
set -e

R_VERSION="3.2.3"
R_BUILD_DIR="../R-$R_VERSION/"
R_DEST_DIR="./r-install/"
SHARED_LIBS_DEST_DIR="./shared-libs/"

echo "Running build for R-$R_VERSION"
echo "looking for binaries built in $R_BUILD_DIR"

rm -r $SHARED_LIBS_DEST_DIR 2> /dev/null

for x in /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libreadline.so.6 /lib/x86_64-linux-gnu/libpcre.so.3 /lib/x86_64-linux-gnu/liblzma.so.5 /lib/x86_64-linux-gnu/libbz2.so.1.0 /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/librt.so.1 /lib/x86_64-linux-gnu/libdl.so.2 /usr/lib/x86_64-linux-gnu/libgomp.so.1 /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libc.so.6 /lib64/ld-linux-x86-64.so.2 /lib/x86_64-linux-gnu/libtinfo.so.5 /usr/lib/x86_64-linux-gnu/libgfortran.so.3 /usr/lib/x86_64-linux-gnu/libquadmath.so.0 /lib/x86_64-linux-gnu/libgcc_s.so.1;
do

    destdir="$SHARED_LIBS_DEST_DIR$(dirname $x)/"
    mkdir -p $destdir
    cp -Lr $x $destdir

    echo "copy $x to $destdir"

done

echo "copied "$(find $SHARED_LIBS_DEST_DIR -type f|wc -l)" files."

rm -r $R_DEST_DIR 2> /dev/null

for x in bin/exec/R bin/javareconf bin/R bin/Rcmd bin/Rd2pdf bin/Rdconv bin/Rdiff bin/Rprof bin/Rscript bin/rtags bin/SHLIB bin/Stangle bin/Sweave lib/* library/* modules/* include/* etc/*;
#  share/* doc/*
do

    destdir="$R_DEST_DIR$(dirname $x)/"
    mkdir -p $destdir
    cp -Lr $R_BUILD_DIR$x $destdir

    echo "copy $R_BUILD_DIR$x to $destdir"

done

echo "copied "$(find $R_DEST_DIR -type f|wc -l)" files."

docker build -t "pipmyday/busybox-r:latest" ./
