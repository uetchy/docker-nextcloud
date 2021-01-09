#!/bin/sh

patch -ruN -p0 -d ./data/app/lib < patches/lib.patch
patch -ruN -p0 -d ./data/app/resources < patches/resources.patch
