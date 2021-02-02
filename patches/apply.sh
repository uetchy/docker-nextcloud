#!/bin/sh

patch -u -N -p0 -d ./data/app/lib < patches/lib.patch
patch -u -N -p0 -d ./data/app/resources < patches/resources.patch
