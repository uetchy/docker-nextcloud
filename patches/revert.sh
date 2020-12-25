#!/bin/sh

patch -d ./data/app/lib -RuN -p0 < patches/lib.patch
patch -d ./data/app/resources -RuN -p0 < patches/resources.patch