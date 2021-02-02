#!/bin/sh

patch -d ./data/app/lib -R -u -p0 < patches/lib.patch
patch -d ./data/app/resources -R -u -p0 < patches/resources.patch