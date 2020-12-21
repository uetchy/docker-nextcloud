#!/bin/sh

patch -d ./data/app/lib -ruN -p0 < patches/lib.patch
patch -d ./data/app/resources -ruN -p0 < patches/resources.patch