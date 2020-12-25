#!/bin/sh

patch -d ./data/app/lib -ruN --dry-run -p0 < patches/lib.patch
patch -d ./data/app/resources -ruN --dry-run -p0 < patches/resources.patch
