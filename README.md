# Pipmyday/busybox-r

Docker base image containing the R interpreter.

[![](https://badge.imagelayers.io/pipmyday/busybox-r:latest.svg)](https://imagelayers.io/?images=pipmyday/busybox-r:latest 'Get your own badge on imagelayers.io')

This minimum-footprint docker image is build using Ubuntu/Wily64 using [busybox:glibc](https://hub.docker.com/_/busybox/).

## Available tags

* `3.2.3`, `latest` [3.2.3/Dockerfile](https://github.com/pipmyday/busybox-r/blob/v3.2.3/Dockerfile)

## Build

Check out the [R source](https://cran.r-project.org/sources.html) into a directory below this (i.e. `../R-3.2.3/`) . `./configure --with-x=no` and `make`.

Run `bash ./build.sh`. The build is meant for Ubuntu/Wily64 using glibc. The dynamic shared libraries are copied into `./shared-libs/` and the R binaries and support files got into `./r-install`. The docker image `pipmyday/r:latest` is built by default, you may want to change this.

----

©2016 by Pipmyday
