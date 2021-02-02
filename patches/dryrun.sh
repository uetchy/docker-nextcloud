#!/bin/sh

patch -d ./data/app/lib -u -N --dry-run -p0 < patches/lib.patch
patch -d ./data/app/resources -u -N --dry-run -p0 < patches/resources.patch
