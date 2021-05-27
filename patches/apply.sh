#!/bin/sh

patch -uNr- -p0 -d ./data/app/lib < patches/lib.patch
patch -uNr- -p0 -d ./data/app/resources < patches/resources.patch
patch -uNr- -p0 -d ./data/app/core < patches/core.patch

fd '.orig$' ./data/app -x rm